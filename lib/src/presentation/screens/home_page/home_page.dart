import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/bloc/pokemon_list/pokemon_cubit.dart';
import 'home_page_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PokemonCubit()..getPokemon(page: 0, orderByNumber: true),
      child: HomePageView(),
    );
  }
}
