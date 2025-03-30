import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../presentation/widgets/widgets.dart';
import '../../models/pokemon/pokemon_detail_model.dart';

class PokemonDetailService {
  Future<PokemonDetailModel?> load(int id) async {
    PokemonDetailModel? pokemonDetail;
    try {
      http.Response response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon/$id/'),
      );
      if (response.statusCode == 200) {
        pokemonDetail = (PokemonDetailModel.fromJson(
          jsonDecode(response.body),
        ));
      }
      return pokemonDetail;
    } catch (e) {
      if (e.toString().contains('Failed host lookup')) {
        ToastWidget().networkErrorToast();
      }
      return null;
    }
  }
}
