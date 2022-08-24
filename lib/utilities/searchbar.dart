import 'package:flutter/material.dart';
import '../screens/interviewers.dart';

class SearchInterviewer extends SearchDelegate {
  AsyncSnapshot snapshot;
  SearchInterviewer(this.snapshot);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: Icon(Icons.search),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back),
      );

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var names in snapshot.data.name.first) {
      if (names.toLowerCase().contains(
            query.toLowerCase(),
          )) {
        matchQuery.add(names);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: ((context, index) {
        var result = matchQuery[index];
        return ListTile(title: Text(result));
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var names in snapshot.data) {
      if (names.toLowerCase().contains(
            query.toLowerCase(),
          )) {
        matchQuery.add(names);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: ((context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      }),
    );
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
