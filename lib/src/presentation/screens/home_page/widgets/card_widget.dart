import 'package:flutter/material.dart';

import '../../../../data/utils/constants.dart';
import '../../../widgets/widgets.dart';
import '../handler/card_handler.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.id,
    required this.image,
    required this.name,
  });

  final String id;
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () async {
        await CardHandler(context: context).navigateToDetail(id);
      },
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.width * .15,
                decoration: BoxDecoration(
                  color: grayColor,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, right: 8),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      id,
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
                Hero(
                  tag: image,
                  child: CustomImageNetwork(size: size.width * .15, url: image),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
