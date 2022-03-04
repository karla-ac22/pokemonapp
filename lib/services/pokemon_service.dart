import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemonapp/models/habilidad.dart';

import 'package:pokemonapp/models/pokemon.dart';

class PokemonService {
  PokemonService();
  final String _url1 = "https://pokeapi.co/api/v2/pokemon";

  Future<List<Pokemon>> getPokemon() async {
    List<Pokemon> result = [];
    try {
      var url = Uri.parse(_url1);
      final response = await http.get(url);
      // ignore: avoid_print
      if (response.body.isEmpty) return result;
      Map<String, dynamic> results = json.decode(response.body);
      List<dynamic> jsonList = results["results"];
      for (var item in jsonList) {
        final data = Pokemon.fromJson(item);
        result.add(data);
      }
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
    }
    return result;
  }

  Future<List<Habilidad>> getHabilidad(String urlp) async {
    List<Habilidad> result = [];
    try {
      var url = Uri.parse(urlp);
      final response = await http.get(url);
      // ignore: avoid_print
      if (response.body.isEmpty) return result;
      Map<String, dynamic> results = json.decode(response.body);
      List<dynamic> jsonList = results["results"];
      for (var item in jsonList) {
        final data = Habilidad.fromJson(item);
        result.add(data);
      }
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
    }
    return result;
  }
}
