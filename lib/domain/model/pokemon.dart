// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

List<Pokemon> pokemonFromJson(String str) =>
    List<Pokemon>.from(json.decode(str).map((x) => Pokemon.fromJson(x)));

String pokemonToJson(List<Pokemon> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pokemon {
  Pokemon({
    required this.name,
    required this.id,
    required this.imageurl,
    required this.xdescription,
    required this.ydescription,
    required this.height,
    required this.category,
    required this.weight,
    required this.evolutions,
    required this.abilities,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    required this.total,
    required this.genderless,
    required this.eggGroups,
    required this.evolvedfrom,
    required this.reason,
    required this.baseExp,
    this.typeofpokemon,
    this.weaknesses,
  });

  String? name;
  String? id;
  String? imageurl;
  String? xdescription;
  String? ydescription;
  String? height;
  String? category;
  String? weight;
  List<String> evolutions;
  List<String> abilities;
  List<String>? typeofpokemon;
  List<String>? weaknesses;
  int? hp;
  int? attack;
  int? defense;
  int? specialAttack;
  int? specialDefense;
  int? speed;
  int? total;
  int? genderless;
  String? eggGroups;
  String? evolvedfrom;
  String? reason;
  String? baseExp;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    name: json["name"],
    id: json["id"],
    imageurl: json["imageurl"],
    xdescription: json["xdescription"],
    ydescription: json["ydescription"],
    height: json["height"],
    category: json["category"],
    weight: json["weight"],
    evolutions: List<String>.from(json["evolutions"].map((x) => x)),
    abilities: List<String>.from(json["abilities"].map((x) => x)),
    typeofpokemon: List<String>.from(json["typeofpokemon"].map((x) => x)),
    weaknesses: List<String>.from(json["weaknesses"].map((x) => x)),
    hp: json["hp"],
    attack: json["attack"],
    defense: json["defense"],
    specialAttack: json["special_attack"],
    specialDefense: json["special_defense"],
    speed: json["speed"],
    total: json["total"],
    genderless: json["genderless"],
    eggGroups: json["egg_groups"],
    evolvedfrom: json["evolvedfrom"],
    reason: json["reason"],
    baseExp: json["base_exp"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "imageurl": imageurl,
    "xdescription": xdescription,
    "ydescription": ydescription,
    "height": height,
    "category": category,
    "weight": weight,
    "evolutions": List<dynamic>.from(evolutions.map((x) => x)),
    "abilities": List<dynamic>.from(abilities.map((x) => x)),
    "hp": hp,
    "attack": attack,
    "defense": defense,
    "special_attack": specialAttack,
    "special_defense": specialDefense,
    "speed": speed,
    "total": total,
    "genderless": genderless,
    "egg_groups": eggGroups,
    "evolvedfrom": evolvedfrom,
    "reason": reason,
    "base_exp": baseExp,
  };
}