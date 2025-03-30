import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';
import '../../models/pokemon/pokemon_detail_model.dart';
import '../../services/services.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial(null, null, true, true));
  List<PokemonItemModel> pokemons = [];

  Future<void> getPokemon({
    required int page,
    required bool orderByNumber,
  }) async {
    try {
      page == 0
          ? emit(PokemonLoading(null, null, state.orderByNumber, state.hasData))
          : null;
      PokemonListModel? pokemonFromService = await HonePageService().load(
        page,
      );

      if (pokemonFromService != null && pokemonFromService.results != null) {
        for (var element in pokemonFromService.results!) {
          pokemons.add(element);
        }
      }
      page == 0
          ? emit(
            PokemonLoaded(
              null,
              pokemons,
              orderByNumber,
              page == 1 ? true : pokemonFromService!.next != null,
            ),
          )
          : orderList(orderByNumber: orderByNumber);
    } catch (e) {
      emit(PokemonError(null, null, true, true));
    }
  }

  orderList({required bool orderByNumber}) {
    if (orderByNumber) {
      pokemons.sort((a, b) => a.id!.compareTo(b.id as num));
      if (state.runtimeType == PokemonSearched) {
        emit(
          PokemonSearched(
            state.pokemonSearched,
            pokemons,
            orderByNumber,
            state.hasData,
          ),
        );
      } else {
        emit(PokemonLoading(null, pokemons, orderByNumber, state.hasData));
        emit(PokemonLoaded(null, pokemons, orderByNumber, state.hasData));
      }
    } else {
      pokemons.sort((a, b) => a.name!.compareTo(b.name as String));
      if (state.runtimeType == PokemonSearched) {
        emit(
          PokemonSearched(
            state.pokemonSearched,
            pokemons,
            orderByNumber,
            state.hasData,
          ),
        );
      } else {
        emit(PokemonLoading(null, pokemons, orderByNumber, state.hasData));
        emit(PokemonLoaded(null, pokemons, orderByNumber, state.hasData));
      }
    }
  }

  searchPokemon(String key) async {
    PokemonDetailModel? pokemonSearched = await SearchService().search(key);
    emit(
      PokemonSearched(
        pokemonSearched,
        pokemons,
        state.orderByNumber,
        state.hasData,
      ),
    );
  }

  cancelSearch() async {
    emit(PokemonLoaded(null, pokemons, state.orderByNumber, state.hasData));
  }
}
