import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:valtre_challege/src/presentation/screens/detail_page/widgets/general_info_widget.dart';
import '../../../../data/handler/color_handler.dart';
import '../../../../domain/models/pokemon/pokemon_detail_model.dart';
import '../../../widgets/widgets.dart';

class BodyDetailWidget extends StatelessWidget {
  const BodyDetailWidget({
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
    Size size = MediaQuery.of(context).size;
    Color customColor = color == 'white' ? Colors.black54 : colorFromInt(color);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              SizedBox(height: size.width * .15),
              typesWidget(size),
              SizedBox(height: size.width * .05),
              statLabel('Abaut', customColor),
              SizedBox(height: size.width * .05),
              GeneralInfoWidget(description: description, item: item),
              SizedBox(height: size.width * .12),
              Text(description),
              SizedBox(height: size.width * .05),
              statLabel('Base Stats', customColor),
              SizedBox(height: size.width * .05),
              statsWidget(size, customColor),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox typesWidget(Size size) {
    return SizedBox(
      child: SizedBox(
        width: size.width * .5,
        child: GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            mainAxisExtent: 20.0,
          ),
          itemCount: item.types?.length,
          itemBuilder: (BuildContext _, int index) {
            return CustomImageNetwork(size: 5, url: item.types?[index] ?? '');
          },
        ),
      ),
    );
  }

  SizedBox statsWidget(Size size, Color customColor) {
    return SizedBox(
      height: size.width * .4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          labelStatsWidget(customColor),
          SizedBox(
            height: size.width * .4,
            width: 2,
            child: Image.asset(
              'assets/images/divider.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          countStatsWidget(size),
          linearStatsWidget(size, customColor),
        ],
      ),
    );
  }

  Column labelStatsWidget(Color customColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        statLabel('HP', customColor),
        statLabel('ATK', customColor),
        statLabel('DEF', customColor),
        statLabel('SATK', customColor),
        statLabel('SDEF', customColor),
        statLabel('SPD', customColor),
      ],
    );
  }

  SizedBox countStatsWidget(Size size) {
    return SizedBox(
      height: size.width * .4,
      width: size.width * .1,
      child: Center(
        child: ListView.builder(
          itemBuilder: (_, index) {
            return statLabel(
              '0${item.stats?[index].baseStat}',
              null,
              FontWeight.normal,
            );
          },
          itemCount: item.stats?.length,
          shrinkWrap: true,
        ),
      ),
    );
  }

  SizedBox linearStatsWidget(Size size, Color customColor) {
    return SizedBox(
      height: size.width * .4,
      width: size.width * .6,
      child: Center(
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, index) {
            return SizedBox(height: 10);
          },
          itemBuilder: (_, index) {
            return LinearPercentIndicator(
              backgroundColor: customColor.withValues(alpha: 0.3),
              progressColor: customColor,
              animationDuration: 1200,
              animation: true,
              lineHeight: 13,
              barRadius: const Radius.circular(50),
              percent: percentMethod(index),
            );
          },
          itemCount: item.stats!.length,
          shrinkWrap: true,
        ),
      ),
    );
  }

  double percentMethod(int index) {
    return (item.stats![index].baseStat! / 100) > 1
        ? 1
        : double.tryParse((item.stats![index].baseStat! / 100).toString())!;
  }

  Text statLabel(
    String title, [
    Color? customColor,
    FontWeight? fit = FontWeight.w700,
  ]) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 17,
        fontWeight: fit,
        fontFamily: 'Arial',
        color: customColor,
      ),
    );
  }
}
