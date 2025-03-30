import 'dart:convert';

import 'package:valtre_challege/src/domain/models/models.dart';

PokemonListModel pokemonModelFromJson(String str) => PokemonListModel.fromJson(json.decode(str));
String pokemonModelToJson(PokemonListModel data) => json.encode(data.toJson());

class PokemonListModel {
  final int? count;
  final String? next;
  final dynamic previous;
  final List<PokemonItemModel>? results;

  PokemonListModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PokemonListModel.fromJson(Map<String, dynamic> json) => PokemonListModel(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: json["results"] == null ? [] : List<PokemonItemModel>.from(json["results"]!.map((x) => PokemonItemModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}
