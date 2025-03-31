import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../../../../data/utils/constants.dart';
import '../../../../domain/models/pokemon/pokemon_detail_model.dart';
import '../../../../domain/services/services.dart';
import '../../detail_page/detail_page.dart';

class CardHandler {
  CardHandler({required this.context});

  final BuildContext context;

  navigateToDetail(String id) async {
    var cancel = BotToast.showCustomLoading(
      toastBuilder: (_) {
        return const CircularProgressIndicator(color: primaryColor);
      },
      clickClose: true,
      backButtonBehavior: BackButtonBehavior.none,
    );
    PokemonDetailModel? item = await PokemonDetailService().load(
      int.parse(id.substring(1)),
    );
    if (item != null) {
      List<String?>? species = await SpeciesService().get(item.specieUrl ?? '');
      cancel();
      if (context.mounted) {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            pageBuilder:
                (_, __, ___) => DetailPage(
                  item: item,
                  color: species?[0] ?? '',
                  description: species?[1] ?? '',
                ),
          ),
        );
      }
    } else {
      cancel();
    }
  }
}
