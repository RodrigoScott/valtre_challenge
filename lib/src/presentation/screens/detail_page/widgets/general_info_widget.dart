import 'package:flutter/material.dart';
import '../../../../domain/models/pokemon/pokemon_detail_model.dart';

class GeneralInfoWidget extends StatelessWidget {
  const GeneralInfoWidget({
    super.key,
    required this.item,
    required this.description,
  });

  final PokemonDetailModel item;
  final String description;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(),
        generalItem(
          'assets/images/weight.png',
          'Weight',
          '${(item.weight!.toDouble() / 10)} kg',
          size,
        ),
        dividerWidget(),
        generalItem(
          'assets/images/size.png',
          'Height',
          '${(item.height!.toDouble() / 10)} m',
          size,
        ),

        dividerWidget(),
        generalMoveItem(size),
        SizedBox(),
      ],
    );
  }

  SizedBox generalMoveItem(Size size) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * .2,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (_, index) {
                return Text(
                  '${(item.abilities?[index])}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                );
              },
              itemCount: item.abilities?.length,
              shrinkWrap: true,
            ),
          ),
          SizedBox(height: size.width * .05),
          Text('Moves'),
        ],
      ),
    );
  }

  SizedBox generalItem(String asset, String title, String contain, Size size) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              iconWidget(asset),
              SizedBox(width: size.width * .03),
              Text(contain),
            ],
          ),
          SizedBox(height: size.width * .05),
          Text(title),
        ],
      ),
    );
  }

  SizedBox iconWidget(String asset) {
    return SizedBox(height: 20, child: Image.asset(asset, fit: BoxFit.fill));
  }

  SizedBox dividerWidget() {
    return SizedBox(
      width: 2,
      child: Image.asset('assets/images/divider.png', fit: BoxFit.fill),
    );
  }
}
