import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokemonapp/models/habilidad.dart';
import 'package:http/http.dart' as http;
import 'package:pokemonapp/services/pokemon_service.dart';

// ignore: must_be_immutable
class AbilityScreen extends StatefulWidget {
  String url;
  AbilityScreen({this.url, Key key}) : super(key: key);

  @override
  State<AbilityScreen> createState() => _AbilityScreenState();
}

class _AbilityScreenState extends State<AbilityScreen> {
  final PokemonService _pokService = PokemonService();
  List<Habilidad> _listHabilidades;

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
            title: const Text("Pokémon App",
                style: TextStyle(fontSize: 20, color: (Colors.white)))),
        body: _listHabilidades == null
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
                    children: _listHabilidades
                        .map((e) => HabilidadesCard(model: e))
                        .toList())));
  }

  _downloadContent() {
    _pokService.getHabilidad(widget.url).then((value) {
      _listHabilidades = value;
      setState(() {});
    });
  }
}

class HabilidadesCard extends StatelessWidget {
  const HabilidadesCard({Key key, this.model}) : super(key: key);
  final Habilidad model;

  @override
  Widget build(BuildContext context) {
    //final url = model.url;
    return Card(
        child: Column(
      children: <Widget>[
        ListTile(
          title: Text(
            model.name,
            style: TextStyle(fontSize: 25, color: Colors.indigo),
          ),
        )
      ],
    ));
  }
}
