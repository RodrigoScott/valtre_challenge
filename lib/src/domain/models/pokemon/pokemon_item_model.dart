class PokemonItemModel {
  final int? id;
  final String? name;
  final String? image;

  PokemonItemModel({this.id, this.name, this.image});

  factory PokemonItemModel.fromJson(Map<String, dynamic> json) {
    List<String> val = json["url"].split('/');
    return PokemonItemModel(
      id: int.tryParse(val[val.length - 2]),
      name: json["name"],
      image:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${val[val.length - 2]}.png',
    );
  }

  Map<String, dynamic> toJson() => {"id": id, "name": name, "url": image};
}
