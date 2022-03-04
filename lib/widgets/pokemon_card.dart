// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:pokemonapp/models/habilidad.dart';
import 'package:pokemonapp/models/pokemon.dart';
import 'package:pokemonapp/pages/ability_screen.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key key, this.model}) : super(key: key);
  final Pokemon model;

  @override
  Widget build(BuildContext context) {
    final url = model.url;
    final img =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png";
    return Card(
        child: Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(img)),
          title: Text(
            model.name,
            style: TextStyle(fontSize: 25, color: Colors.indigo),
          ),
          subtitle: Text("Ver más... "),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AbilityScreen(
                          url: url,
                        )));
          },
        )
      ],
    ));
  }
}
