import 'dart:convert';

import 'package:http/http.dart' as http;

import '../presentation/widgets/toast_widget.dart';
import 'models/models.dart';

class HonePageService {
  Future<PokemonListModel?> load(int page) async {
    PokemonListModel? pokemonList;
    try {
      http.Response response = await http.get(
        Uri.parse(
          'https://pokeapi.co/api/v2/pokemon/?limit=20&offset=${page == 0 ? 0 : page * 20}',
        ),
      );
      if (response.statusCode == 200) {
        pokemonList = (PokemonListModel.fromJson(jsonDecode(response.body)));
      }
      return pokemonList;
    } catch (e) {
      if (e.toString().contains('Failed host lookup')) {
        ToastWidget().networkErrorToast();
      }
      return null;
    }
  }
}
