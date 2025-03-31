part of 'pokemon_cubit.dart';

sealed class PokemonState extends Equatable {
  const PokemonState(
    this.pokemonSearched,
    this.pokemonList,
    this.orderByNumber,
    this.hasData,
  );

  final PokemonDetailModel? pokemonSearched;
  final List<PokemonItemModel>? pokemonList;
  final bool orderByNumber;
  final bool hasData;
}

final class PokemonInitial extends PokemonState {
  const PokemonInitial(
    super.pokemonSearched,
    super.pokemonList,
    super.orderByNumber,
    super.hasData,
  );

  @override
  List<Object?> get props => throw UnimplementedError();
}

class PokemonLoading extends PokemonState {
  const PokemonLoading(
    super.pokemonSearched,
    super.pokemonList,
    super.orderByNumber,
    super.hasData,
  );

  @override
  List<Object?> get props => [];
}

class PokemonLoaded extends PokemonState {
  const PokemonLoaded(
    super.pokemonSearched,
    super.pokemonList,
    super.orderByNumber,
    super.hasData,
  );

  @override
  List<Object?> get props => [orderByNumber, pokemonList, hasData];
}

class PokemonSearched extends PokemonState {
  const PokemonSearched(
    super.pokemonSearched,
    super.pokemonList,
    super.orderByNumber,
    super.hasData,
  );

  @override
  List<Object?> get props => [orderByNumber, pokemonList, pokemonSearched];
}

final class PokemonError extends PokemonState {
  const PokemonError(
      super.pokemonSearched,
      super.pokemonList,
      super.orderByNumber,
      super.hasData,
      );

  @override
  List<Object?> get props => throw UnimplementedError();
}
