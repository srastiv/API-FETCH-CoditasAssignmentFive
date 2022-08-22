import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../models/InterviewTile_data_model.dart';

Future<List<InterviewerTile>> getInterviewerData() async {
  try {
    var response = await http.get(
      Uri.parse('https://randomuser.me/api/?seed=ab&inc=name,cell&results=20'),
    );

    if (response.statusCode == 200) {
      String data = response.body;

      //var names = jsonDecode(data)["results"][0]["name"]["first"];
      var decodedData = jsonDecode(data);
      List jsonData = decodedData["results"];
      //print(jsonData);
      var result = jsonData
          .map(
            (element) => (InterviewerTile.fromJson(element)),
          )
          .toList();

      return result;
    } else {
      return [];
    }
  } catch (e) {
    print(e);
  }

  return [];
}
