import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokemonapp/models/pokemon.dart';

import 'package:pokemonapp/pages/ability_screen.dart';
import 'package:pokemonapp/services/pokemon_service.dart';
import 'package:pokemonapp/widgets/pokemon_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PokemonService _pokService = PokemonService();
  List<Pokemon> _listPokemon;

  @override
  void initState() {
    super.initState();
    _downloadContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
            title: const Text("Pokémon App",
                style: TextStyle(fontSize: 20, color: (Colors.white)))),
        body: _listPokemon == null
            ? const Center(
                child: SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: CircularProgressIndicator()),
              )
            : Container(
                child: ListView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 7.0),
                    children: _listPokemon
                        .map((e) => PokemonCard(model: e))
                        .toList())));
  }

  _downloadContent() {
    _pokService.getPokemon().then((value) {
      _listPokemon = value;
      setState(() {});
    });
  }
}
