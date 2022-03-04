import 'package:flutter/material.dart';
import 'package:pokemonapp/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokémon App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: const AppBarTheme(color: Colors.deepPurple),
      ),
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
      },
    );
  }
}
