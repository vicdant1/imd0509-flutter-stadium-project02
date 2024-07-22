import 'package:flutter/material.dart';
import 'package:stadium/models/StadiumData.dart';
import 'package:stadium/views/addStadiumScreen.dart';
import 'package:stadium/views/coachScreen.dart';
import 'package:stadium/views/countryScreen.dart';
import 'package:stadium/views/leagueScreen.dart';
import 'package:stadium/views/playerScreen.dart';
import 'package:stadium/views/stadiumListScreen.dart';

void main() {
  runApp(StadiumApp());
}

class StadiumApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stadium',
      theme: ThemeData(
        primaryColor: Colors.blue[900], // Cor primária azul escuro
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue, // Define a cor primária
          accentColor: Colors.orangeAccent, // Cor secundária laranja
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline6: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold), // Títulos grandes e negrito
          bodyText2: TextStyle(fontSize: 16), // Corpo de texto padrão
          subtitle1: TextStyle(
              fontStyle: FontStyle.italic), // Estilo itálico para destaque
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => StadiumListScreen(),
        '/player': (context) => PlayerScreen(),
        '/coach': (context) => CoachScreen(),
        '/country': (context) => CountryScreen(),
        '/league': (context) => LeagueScreen(),
        '/addStadium': (context) => AddStadiumScreen(),
      },
    );
  }
}

List<StadiumData> stadiumData = [
  StadiumData(
    name: 'Old Trafford',
    location: 'Manchester, Inglaterra',
    capacity: 74879,
    opened: '19 de Fevereiro de 1910',
    image: 'assets/images/old_trafford.jpg',
  ),
  StadiumData(
    name: 'Santiago Bernabéu',
    location: 'Madri, Espanha',
    capacity: 81044,
    opened: '14 de Dezembro de 1947',
    image: 'assets/images/santiago_bernabeu.jpg',
  ),
  StadiumData(
    name: 'Camp Nou',
    location: 'Barcelona, Espanha',
    capacity: 99354,
    opened: '24 de Setembro 1957',
    image: 'assets/images/camp_nou.jpg',
  ),
];
