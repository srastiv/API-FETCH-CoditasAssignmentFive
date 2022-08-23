import 'package:flutter/material.dart';

class SearchInterviewer extends SearchDelegate {
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

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('search interviewers'),
    );
    // TODO: implement buildResults
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('search interviewers'),
    );
    // TODO: implement buildSuggestions
  }
}


// List<String> searchResult = ['brazil'];
// @override
// Widget buildSuggestions(BuildContext context) {
//   return Center(
//     child: Text('search interviewers'),
//   );
//   List<String> suggestions = searchResult.where((searchResult) {
//     final result = searchResult.toLowerCase();
//     final input = query.toLowerCase();
//     return result.contains(input);
//   }).toList();

//   return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         final suggestion = suggestions[index];
//         return ListTile(
//           title: Text(' bl'),
//         );
//       });
// }
