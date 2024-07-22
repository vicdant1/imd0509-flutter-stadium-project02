import 'package:flutter/material.dart';
import 'package:stadium/components/stadiumListItem.dart';
import 'package:stadium/main.dart';
import 'package:stadium/models/StadiumData.dart';

class StadiumListScreen extends StatefulWidget {
  @override
  _StadiumListScreenState createState() => _StadiumListScreenState();
}

class _StadiumListScreenState extends State<StadiumListScreen> {
  List<StadiumData> stadiums = List.from(stadiumData);
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stadium 🏆'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: StadiumSearchDelegate(stadiums),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/addStadium').then((value) {
                if (value != null && value is StadiumData) {
                  setState(() {
                    stadiums.add(value);
                  });
                }
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: stadiums.length,
        itemBuilder: (BuildContext context, int index) {
          return StadiumListItem(stadiums[index]);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.people),
              onPressed: () {
                Navigator.pushNamed(context, '/coach');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StadiumSearchDelegate extends SearchDelegate<String> {
  final List<StadiumData> stadiums;

  StadiumSearchDelegate(this.stadiums) : super(searchFieldLabel: "Filtrar estádios");

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final List<StadiumData> filteredStadiums = stadiums
        .where((stadium) =>
            stadium.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return filteredStadiums.length > 0 ? ListView.builder(
      itemCount: filteredStadiums.length,
      itemBuilder: (BuildContext context, int index) {
        return StadiumListItem(filteredStadiums[index]);
      },
    ) : Center(child: Text('Não encontramos nada :\'/'),);
  }
}
