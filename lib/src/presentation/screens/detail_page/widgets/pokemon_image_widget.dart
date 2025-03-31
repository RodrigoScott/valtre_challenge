import 'package:flutter/material.dart';
import '../../../widgets/widgets.dart';

class PokemonImageWidget extends StatelessWidget {
  const PokemonImageWidget({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      top: size.width * .15,
      left: (size.width - size.width * .55) / 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 8.0),
        child: Hero(
          tag: image,
          child: CustomImageNetwork(size: size.width * .55, url: image),
        ),
      ),
    );
  }
}
