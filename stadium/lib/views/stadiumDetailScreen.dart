import 'package:flutter/material.dart';
import 'package:stadium/models/StadiumData.dart';

class StadiumDetailScreen extends StatelessWidget {
  final StadiumData stadium;

  StadiumDetailScreen(this.stadium);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          stadium.name,
          style: TextStyle(
              color: Colors.white), // Cor de texto personalizada para o título
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(stadium.image),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Localização: ${stadium.location}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue[900], // Cor personalizada para o texto
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Capacidade: ${stadium.capacity}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue[900], // Cor personalizada para o texto
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Fundado em: ${stadium.opened}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue[900], // Cor personalizada para o texto
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.location_on),
              onPressed: () {
                Navigator.pushNamed(context, '/country', arguments: stadium);
              },
            ),
            IconButton(
              icon: Icon(Icons.emoji_events),
              onPressed: () {
                Navigator.pushNamed(context, '/league', arguments: stadium);
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.pushNamed(context, '/player', arguments: stadium);
              },
            ),
          ],
        ),
      ),
    );
  }
}