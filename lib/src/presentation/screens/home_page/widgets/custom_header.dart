import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valtre_challege/src/presentation/screens/home_page/widgets/widgets.dart';

import '../../../../data/utils/constants.dart';
import '../../../../domain/bloc/pokemon_list/pokemon_cubit.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          title(size),
          SizedBox(height: 8),
          searchWidget(size, context),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Row searchWidget(Size size, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: size.width * .78, child: SearchBarWidget()),
        Expanded(
          child: BlocBuilder<PokemonCubit, PokemonState>(
            builder: (context, state) {
              return filterButton(context, state);
            },
          ),
        ),
      ],
    );
  }

  filterButton(BuildContext context, PokemonState state) {
    return RawMaterialButton(
      onPressed: () {
        context.read<PokemonCubit>().orderList(
              orderByNumber: !state.orderByNumber,
            );
      },
      elevation: 2.0,
      fillColor: Colors.white,
      padding: EdgeInsets.all(10),
      shape: CircleBorder(),
      child: Icon(
        state.orderByNumber ? Icons.numbers : Icons.sort_by_alpha,
        size: 25.0,
        color: primaryColor,
      ),
    );
  }

  Row title(Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 4),
          child: SizedBox(
            height: size.width * .08,
            child: Image.asset('assets/images/pokeball.png'),
          ),
        ),
        Text(
          'Pokédex',
          style: TextStyle(
            fontSize: size.width * .08,
            fontWeight: FontWeight.w700,
            fontFamily: 'Arial',
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
