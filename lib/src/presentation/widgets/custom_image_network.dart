import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/utils/constants.dart';

class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({super.key, required this.size, required this.url});

  final double size;
  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: size,
      imageUrl: url,
      placeholder:
          (context, url) =>
              Center(child: CircularProgressIndicator(color: primaryColor)),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
