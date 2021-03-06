// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

//String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  Pokemon({
    this.name,
    this.url,
  });

  String name;
  String url;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        url: json["url"],
      );
}
