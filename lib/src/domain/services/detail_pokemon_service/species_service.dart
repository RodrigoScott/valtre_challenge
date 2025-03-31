import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../presentation/widgets/toast_widget.dart';

class SpeciesService {
  Future<List<String?>?> get(String url) async {
    List<String?> species = [];
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        species.add(jsonDecode(response.body)['color']['name']);
        species.add(jsonDecode(response.body)['flavor_text_entries'][1]['flavor_text'].toString().replaceAll('\n', ''));
      }
      return species;
    } catch (e) {
      if (e.toString().contains('Failed host lookup')) {
        ToastWidget().networkErrorToast();
      }
      return null;
    }
  }
}
