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
    //la imagen debería venir del .../1 sprites
    final img =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png";

    return Card(
        elevation: 5,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(img)),
              title: Text(
                model.name,
                style: TextStyle(fontSize: 25, color: Colors.indigo),
              ),
              subtitle: Text("Ver más... ",
                  style: TextStyle(color: Colors.deepPurpleAccent[50])),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          elevation: 5,
                          title: const Text("Nombre del Pokémon",
                              style: TextStyle(
                                  fontSize: 35, color: Colors.deepPurple)),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(10)),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                "Aquí iría la habilidad",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Regresar",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ))
                          ]);
                    });
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AbilityScreen(
                              url: url,
                            )));*/
              },
            )
          ],
        ));
  }
}
