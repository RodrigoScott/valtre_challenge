import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../presentation/widgets/widgets.dart';
import '../../models/pokemon/pokemon_detail_model.dart';

class SearchService {
  Future<PokemonDetailModel?> search(String key) async {
    PokemonDetailModel? pokemonSearched;
    try {
      http.Response response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon/$key'),
      );

      if (response.statusCode == 200) {
        pokemonSearched = PokemonDetailModel.fromJson(
          jsonDecode(response.body),
        );
      }
      return pokemonSearched;
    } catch (e) {
      if (e.toString().contains('Failed host lookup')) {
        ToastWidget().networkErrorToast();
      }
      return null;
    }
  }
}
