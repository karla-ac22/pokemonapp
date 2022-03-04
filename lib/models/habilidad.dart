// To parse this JSON data, do
//
//     final habilidad = habilidadFromJson(jsonString);

import 'dart:convert';

Habilidad habilidadFromJson(String str) => Habilidad.fromJson(json.decode(str));

String habilidadToJson(Habilidad data) => json.encode(data.toJson());

class Habilidad {
  Habilidad({
    this.abilities,
    this.id,
    this.name,
  });

  List<Ability> abilities;

  int id;

  String name;

  factory Habilidad.fromJson(Map<String, dynamic> json) => Habilidad(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "id": id,
        "name": name,
      };
}

class Ability {
  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  Species ability;
  bool isHidden;
  int slot;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class Species {
  Species({
    this.name,
    this.url,
  });

  String name;
  String url;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
