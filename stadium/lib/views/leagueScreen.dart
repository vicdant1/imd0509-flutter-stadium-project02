import 'package:flutter/material.dart';
import 'package:stadium/models/StadiumData.dart';

class LeagueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StadiumData stadium =
        ModalRoute.of(context)!.settings.arguments as StadiumData;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Liga',
          style: TextStyle(
              color: Colors.white), // Cor de texto personalizada para o título
        ),
      ),
      body: Center(
        child: Text(
          'Liga: ${stadium.name}',
          style: Theme.of(context)
              .textTheme
              .bodyText2, // Aplicar estilo de texto personalizado
        ),
      ),
    );
  }
}