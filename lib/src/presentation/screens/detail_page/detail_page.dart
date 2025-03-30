import 'package:flutter/material.dart';
import 'package:valtre_challege/src/presentation/screens/detail_page/widgets/widgets.dart';

import '../../../data/handler/color_handler.dart';
import '../../../domain/models/pokemon/pokemon_detail_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.item,
    required this.color,
    required this.description,
  });

  final PokemonDetailModel item;
  final String color;
  final String description;

  @override
  Widget build(BuildContext context) {
    Color customColor = color == 'white' ? Colors.black54 : colorFromInt(color);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(backgroundColor: customColor),
      ),
      body: Container(
        width: double.infinity,
        height: size.height,
        color: customColor,
        child: Stack(
          children: [
            Column(
              children: [
                HeaderWidget(name: item.name ?? '', id: item.id ?? 0),
                BodyDetailWidget(
                  color: color,
                  description: description,
                  item: item,
                ),
              ],
            ),
            PokemonImageWidget(image: item.image ?? ''),
          ],
        ),
      ),
    );
  }
}
