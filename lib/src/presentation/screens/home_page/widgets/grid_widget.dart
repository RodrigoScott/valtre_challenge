import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valtre_challege/src/presentation/screens/home_page/widgets/widgets.dart';

import '../../../../data/utils/constants.dart';
import '../../../../domain/bloc/pokemon_list/pokemon_cubit.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({super.key, required this.state, required this.isSearch});

  final PokemonState state;
  final bool isSearch;

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  int page = 0;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    onScrollFunction();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount:
          widget.isSearch
              ? 1
              : widget.state.pokemonList!.length +
                  (widget.state.hasData ? 1 : 0),
      itemBuilder: (BuildContext context, int index) {
        if (!widget.isSearch) {
          if (index == widget.state.pokemonList!.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(color: primaryColor),
                ),
              ),
            );
          } else {
            var item = widget.state.pokemonList![index];
            return CardWidget(
              id: '#${item.id! < 100 ? item.id.toString().padLeft(3, '0') : item.id}',
              name: '${item.name![0].toUpperCase()}${item.name!.substring(1)}',
              image: item.image ?? '',
            );
          }
        } else {
          var searched = widget.state.pokemonSearched;
          return CardWidget(
            id:
                '#${searched!.id! < 100 ? searched.id.toString().padLeft(3, '0') : searched.id}',
            image: searched.image ?? '',
            name:
                '${searched.name![0].toUpperCase()}${searched.name!.substring(1)}',
          );
        }
      },
    );
  }

  void onScrollFunction() {
    return WidgetsBinding.instance.addPostFrameCallback((_) async {
      scrollController.addListener(() {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
            page++;
            context
                .read<PokemonCubit>()
                .getPokemon(
                  page: page,
                  orderByNumber: widget.state.orderByNumber,
                )
                .then((_) {
                  if (widget.state.hasData && page != 0) {
                    Future.delayed(const Duration(seconds: 1), () {
                      scrollController.animateTo(
                        scrollController.offset + 35,
                        duration: const Duration(seconds: 1),
                        curve: Curves.elasticOut,
                      );
                    });
                  }
                });
          }
        }
      });
    });
  }
}
