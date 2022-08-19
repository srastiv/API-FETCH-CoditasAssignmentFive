import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate {

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: Icon(Icons.arrow_back))
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        onPressed: () {},
        icon: Icon(Icons.search),
      );
}

@override
Widget buildResults(BuildContext context) => Center(child: Text(query, style: TextStyle(fontSize: 10)),)
 List<String> searchResult = ['brazil'];
@override

Widget buildSuggestions(BuildContext context) {
List <String> suggestions = searchResult.where((searchResult)
{
  final result = searchResult.toLowerCase();
  final input = query.toLowerCase();
  return result.contains(input);
}).toList();

return ListView.builder(
  itemCount: suggestions.length,
  itemBuilder: (context, index){
  final suggestion = suggestions[index];
})
}
