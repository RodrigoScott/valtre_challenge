import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valtre_challege/src/presentation/screens/home_page/widgets/widgets.dart';

import '../../../../data/utils/constants.dart';
import '../../../../domain/bloc/pokemon_list/pokemon_cubit.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      color: primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: BlocBuilder<PokemonCubit, PokemonState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case const (PokemonLoading):
                return Center(
                  child: const CircularProgressIndicator(color: primaryColor),
                );
              case const (PokemonLoaded):
                return state.pokemonList!.isNotEmpty
                    ? GridWidget(state: state, isSearch: false)
                    : textAlertWidget(
                      size,
                      'The information could not be loaded, please try again later.',
                    );
              case const (PokemonSearched):
                return state.pokemonSearched?.name != null
                    ? GridWidget(state: state, isSearch: true)
                    : textAlertWidget(
                      size,
                      'This Pokémon was not found, please type the name you are looking for correctly.',
                    );
              case const (PokemonError):
                return Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<PokemonCubit>().getPokemon(
                        page: 0,
                        orderByNumber: true,
                      );
                    },
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: const Text('Retry'),
                  ),
                );
              default:
                return Center(
                  child: const CircularProgressIndicator(color: primaryColor),
                );
            }
          },
        ),
      ),
    );
  }

  Center textAlertWidget(Size size, String text) {
    return Center(
      child: SizedBox(
        width: size.width * .9,
        child: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
