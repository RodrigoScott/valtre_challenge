import 'dart:convert';

PokemonDetailModel pokemonDetailModelFromJson(String str) =>
    PokemonDetailModel.fromJson(json.decode(str));

String pokemonDetailModelToJson(PokemonDetailModel data) =>
    json.encode(data.toJson());

class PokemonDetailModel {
  final String? image;
  final List<String>? abilities;
  final int? height;
  final int? id;
  final String? name;
  final List<Stat>? stats;
  final List<String>? types;
  final int? weight;
  final String? specieUrl;

  PokemonDetailModel({
    this.image,
    this.abilities,
    this.height,
    this.id,
    this.name,
    this.stats,
    this.types,
    this.weight,
    this.specieUrl,
  });

  factory PokemonDetailModel.fromJson(
      Map<String, dynamic> json,
      ) => PokemonDetailModel(
    image:
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${json["id"]}.png',
    abilities:
    json["abilities"] == null
        ? []
        : List<String>.from(
      json["abilities"]!.map((x) => x['ability']['name']),
    ),
    height: json["height"],
    id: json["id"],
    name: '${json['name'][0].toUpperCase()}${json['name'].substring(1)}',
    stats:
    json["stats"] == null
        ? []
        : List<Stat>.from(json["stats"]!.map((x) => Stat.fromJson(x))),
    types:
    json["types"] == null
        ? []
        : List<String>.from(
      json["types"]!.map((x) {
        List<String> val = x['type']['url'].split('/');
        return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/types/generation-ix/scarlet-violet/${val[val.length - 2]}.png';
      }),
    ),
    weight: json["weight"],
    specieUrl: json['species']['url'],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "abilities":
    abilities == null
        ? []
        : List<String>.from(abilities!.map((x) => x.toString())),
    "height": height,
    "id": id,
    "name": name,
    "stats":
    stats == null ? [] : List<dynamic>.from(stats!.map((x) => x.toJson())),
    "types":
    types == null
        ? []
        : List<dynamic>.from(types!.map((x) => x.toString())),
    "weight": weight,
    "specieUrl": specieUrl,
  };
}

class StatClass {
  final String? name;
  final String? url;

  StatClass({this.name, this.url});

  factory StatClass.fromJson(Map<String, dynamic> json) =>
      StatClass(name: json["name"], url: json["url"]);

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}

class Stat {
  final int? baseStat;
  final int? effort;
  final StatClass? stat;

  Stat({this.baseStat, this.effort, this.stat});

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    baseStat: json["base_stat"],
    effort: json["effort"],
    stat: json["stat"] == null ? null : StatClass.fromJson(json["stat"]),
  );

  Map<String, dynamic> toJson() => {
    "base_stat": baseStat,
    "effort": effort,
    "stat": stat?.toJson(),
  };
}
