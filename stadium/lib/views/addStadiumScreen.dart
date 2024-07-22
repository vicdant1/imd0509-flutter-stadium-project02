import 'package:flutter/material.dart';
import 'package:stadium/models/StadiumData.dart';

class AddStadiumScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();
  final TextEditingController _openedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Adicionar estádio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Localização'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _capacityController,
              decoration: InputDecoration(labelText: 'Capacidade'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _openedController,
              decoration: InputDecoration(labelText: 'Fundado em'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isEmpty ||
                    _locationController.text.isEmpty ||
                    _capacityController.text.isEmpty ||
                    _openedController.text.isEmpty) {
                  // Show modal alert
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Campos obrigatórios"),
                        content: Text(
                            "Por favor, preencha todos os campos antes de adicionar o estádio."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }

                StadiumData newStadium = StadiumData(
                  name: _nameController.text,
                  location: _locationController.text,
                  capacity: int.tryParse(_capacityController.text) ?? 0,
                  opened: _openedController.text,
                  image:
                      'assets/images/default.jpg', // Defina uma imagem padrão ou permita ao usuário fazer upload de uma imagem
                );
                Navigator.pop(context, newStadium);
              },
              child: Text('Adicionar estádio'),
            ),
          ],
        ),
      ),
    );
  }
}
