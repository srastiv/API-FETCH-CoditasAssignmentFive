import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../models/InterviewTile_data_model.dart';

Future<List<InterviewerTile>> getInterviewerData({String? query}) async {
  try {
    var response = await http.get(
      Uri.parse('https://randomuser.me/api/?seed=ab&inc=name,cell&results=20'),
    );

    if (response.statusCode == 200) {
      debugPrint('Status Code: ${response.statusCode.toString()}');
      String data = response.body;

      //var names = jsonDecode(data)["results"][0]["name"]["first"];
      var decodedData = jsonDecode(data);
      List jsonData = decodedData["results"];
      print(jsonData);
      var result = jsonData
          .map(
            (el) => (InterviewerTile.fromJson(el)),
          )
          .toList();

      if (query != null) {
        result = result
            .where(
              (element) => element.name.first.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .toList();
      }

      List tempList = [];
      for (int i = 0; i < response.body.length; i++) {
        tempList.add(response.body[i]);
      }

      // List names = []; //names from api
      // List filteredNames = [];
      // names = tempList;
      // filteredNames = names;

      return result;
    } else {
      return [];
    }
  } catch (e) {
    print(e);
  }

  return [];
}
