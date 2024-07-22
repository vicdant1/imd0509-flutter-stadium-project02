import 'package:flutter/material.dart';
import 'package:stadium/models/StadiumData.dart';
import 'package:stadium/views/stadiumDetailScreen.dart';

class StadiumListItem extends StatelessWidget {
  final StadiumData stadium;

  StadiumListItem(this.stadium);
  

  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(stadium.image),
          child: Text(stadium.name[0].toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
        ),
        title: Text(
          stadium.name,
          style: Theme.of(context)
              .textTheme
              .headline6, // Aplicar estilo de título personalizado
        ),
        subtitle: Text(stadium.location),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StadiumDetailScreen(stadium),
            ),
          );
        },
      ),
    );
  }
}
