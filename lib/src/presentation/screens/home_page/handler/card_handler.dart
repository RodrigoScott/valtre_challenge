import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../../../data/utils/constants.dart';
import '../../../../domain/models/pokemon/pokemon_detail_model.dart';
import '../../../../domain/services/services.dart';
import '../detail_page/detail_page.dart';

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
        Navigator.pushAndRemoveUntil(
          context,
          PageAnimationTransition(
            page: DetailPage(),
            pageAnimationType: RightToLeftTransition(),
          ),
          (route) => true,
        );
      }
    } else {
      cancel();
    }
  }
}
