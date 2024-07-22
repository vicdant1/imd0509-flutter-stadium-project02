import 'package:flutter/material.dart';
import 'package:stadium/models/StadiumData.dart';

class CountryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StadiumData stadium =
        ModalRoute.of(context)!.settings.arguments as StadiumData;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Localização',
          style: TextStyle(
              color: Colors.white), // Cor de texto personalizada para o título
        ),
      ),
      body: Center(
        child: Text(
          'Localização: ${stadium.location}',
          style: Theme.of(context)
              .textTheme
              .bodyText2, // Aplicar estilo de texto personalizado
        ),
      ),
    );
  }
}