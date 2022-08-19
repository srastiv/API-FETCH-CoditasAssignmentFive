import 'dart:convert';
import 'package:coditas_assignment_5_api/models/InterviewTile.dart';
import 'package:coditas_assignment_5_api/screens/chosen_interviewer.dart';
import 'package:coditas_assignment_5_api/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Interviewers extends StatefulWidget {
  const Interviewers({Key? key}) : super(key: key);

  @override
  State<Interviewers> createState() => _InterviewersState();
}

class _InterviewersState extends State<Interviewers> {
  // InterviewerTile tile = InterviewerTile();

  Future<List<InterviewerTile>> getInterviewerData() async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://randomuser.me/api/?seed=ab&inc=name,cell&results=20'),
        // Uri.https('randomuser.me', 'api/?seed=ab&inc=name,cell&results=20'),
      );

      if (response.statusCode == 200) {
        String data = response.body;
        // print(data);

        //var names = jsonDecode(data)["results"][0]["name"]["first"];
        var decodedData = jsonDecode(data);
        // print(decodedData['results']);
        List jsonData = decodedData["results"];
        print(jsonData);
        var result = jsonData
            .map((element) => (InterviewerTile.fromJson(element)))
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 211, 212, 216),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35, right: 95),
                    child: Container(
                      child: kInterviewers,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none,
                        ),
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          onPressed: () {
                            showSearch(context: context: context, delegate:MySearchDelegate())
                            debugPrint("button pressed");
                          },
                          icon: Icon(Icons.search),
                          color: Colors.grey.shade700,
                        ),
                        labelText: "Search Interviewers",
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(right: 300),
                    child: Text(
                      "1 ADDED",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 116, 114, 114),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height - 220,
                    child: FutureBuilder<List<InterviewerTile>>(
                      future: getInterviewerData(),
                      builder: (context,
                          AsyncSnapshot<List<InterviewerTile>> snapshot) {
                        if (snapshot.hasError) {
                          return Container(
                            child: Center(
                              child: Text("Loading"),
                            ),
                          );
                        } else if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    snapshot.data![index].name.first,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  subtitle: Text(snapshot.data![index].cell),
                                  trailing: TextButton(
                                      child: Text('ADD'), onPressed: () {}),
                                );
                              });
                        } else
                          return CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 60,
                    alignment: Alignment.bottomCenter,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(151, 211, 212, 216),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 280),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => ChosenInterviewer()),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shadowColor: Color.fromARGB(255, 47, 146, 80),
                          primary: Color.fromARGB(255, 47, 146, 80),
                        ),
                        child: const Text(
                          'NEXT',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
