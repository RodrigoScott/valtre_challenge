import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/utils/constants.dart';
import '../../../../data/utils/debounce_timer.dart';
import '../../../../domain/bloc/pokemon_list/pokemon_cubit.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController search = TextEditingController();
  final debounce = DebounceTimer();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(50),
      ),
      elevation: 5,
      child: TextField(
        decoration: defaultDecoration(context),
        controller: search,
        onChanged: (val) {
          debounce.run(() {
            context.read<PokemonCubit>().searchPokemon(search.text);
          });
        },
      ),
    );
  }

  InputDecoration defaultDecoration(BuildContext context) {
    bool canTap = false;
    return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      prefixIcon: Icon(Icons.search, color: primaryColor),
      suffixIcon: BlocListener<PokemonCubit, PokemonState>(
        listener: (context, state) {
          switch (state.runtimeType){
            case const (PokemonSearched):
              canTap = true;
              break;
            case const (PokemonLoaded):
              canTap = false;
              break;
          }
        },
        child: InkWell(
          onTap: () {
            canTap ? context.read<PokemonCubit>().cancelSearch() : null;
            search.clear();
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
          },
          child: Icon(Icons.close, color: primaryColor),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: const BorderSide(color: Colors.black26),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: const BorderSide(color: Colors.black26),
      ),
    );
  }

}
