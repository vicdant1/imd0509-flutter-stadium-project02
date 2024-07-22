import 'package:flutter/material.dart';
import 'package:stadium/models/Coach.dart';

class CoachScreen extends StatefulWidget {
  @override
  _CoachScreenState createState() => _CoachScreenState();
}

class _CoachScreenState extends State<CoachScreen> {
  List<Coach> legendaryCoaches = [
    Coach(name: 'Helenio Herrera', team: 'Inter de Milão', country: 'Argentina'),
    Coach(name: 'Bob Paisley', team: 'Liverpool', country: 'Inglaterra'),
    Coach(name: 'Johan Cruyff', team: 'Barcelona', country: 'Holanda'),
    Coach(name: 'Sir Alex Ferguson', team: 'Manchester United', country: 'Escócia'),
  ];

  void _showAddCoachDialog() {
    TextEditingController nameController = TextEditingController();
    TextEditingController teamController = TextEditingController();
    TextEditingController countryController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Adicionar treinador"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Nome"),
                ),
                TextField(
                  controller: teamController,
                  decoration: InputDecoration(labelText: "Equipe"),
                ),
                TextField(
                  controller: countryController,
                  decoration: InputDecoration(labelText: "País"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  legendaryCoaches.add(Coach(
                    name: nameController.text,
                    team: teamController.text,
                    country: countryController.text,
                  ));
                });
                Navigator.of(context).pop();
              },
              child: Text("Adicionar"),
            ),
          ],
        );
      },
    );
  }

  // Function to show edit coach dialog
  void _showEditCoachDialog(Coach coach) {
    TextEditingController nameController =
        TextEditingController(text: coach.name);
    TextEditingController teamController =
        TextEditingController(text: coach.team);
    TextEditingController countryController =
        TextEditingController(text: coach.country);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Editar Treinador"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Nome"),
                ),
                TextField(
                  controller: teamController,
                  decoration: InputDecoration(labelText: "Equipe"),
                ),
                TextField(
                  controller: countryController,
                  decoration: InputDecoration(labelText: "País"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  coach.name = nameController.text;
                  coach.team = teamController.text;
                  coach.country = countryController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text("Salvar"),
            ),
          ],
        );
      },
    );
  }

  // Function to show delete coach dialog
  void _showDeleteCoachDialog(Coach coach) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Deletar Treinador"),
          content: Text(
              "Tem certeza de que quer deletar o treinador ${coach.name}?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  legendaryCoaches.remove(coach);
                });
                Navigator.of(context).pop();
              },
              child: Text("Prosseguir"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Treinadores Lendários',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: legendaryCoaches.length > 0
          ? ListView.builder(
              itemCount: legendaryCoaches.length,
              itemBuilder: (context, index) {
                return CoachCard(
                  coach: legendaryCoaches[index],
                  onEdit: () {
                    _showEditCoachDialog(legendaryCoaches[index]);
                  },
                  onDelete: () {
                    _showDeleteCoachDialog(legendaryCoaches[index]);
                  },
                );
              },
            )
          : Center(
              child: Text('Nenhum treinador cadastrado :\'/'),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddCoachDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CoachCard extends StatelessWidget {
  final Coach coach;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const CoachCard({Key? key, required this.coach, this.onEdit, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Text(
          coach.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              coach.team,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              coach.country,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
