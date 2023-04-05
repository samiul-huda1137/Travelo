import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(''),
        actions: [
          IconButton(onPressed: (){
            showSearch(
                context: context,
                delegate: CustomSearchDelegate(),);
          },
              icon: const Icon(Icons.search_rounded, color: Color(0xFF5d69b3)),
          )
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate{
  List<String> searchTerms = [
    'British Columbia',
    'Icefields',
    'Moraine Lake',
    'Ontario',
    'Gaza',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          close(context, null);
        },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var places in searchTerms){
      if (places.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(places);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var places in searchTerms){
      if (places.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(places);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index){
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }
    );
  }
}
