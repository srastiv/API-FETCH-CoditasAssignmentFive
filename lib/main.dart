import 'package:coditas_assignment_5_api/models/Interviewer_count_Provider.dart';
import 'package:coditas_assignment_5_api/models/InterviewTile_data_model.dart';
import 'package:coditas_assignment_5_api/screens/interviewers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/interviewers_fetch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InterviewerCountProvider()),
        // ChangeNotifierProvider(create: (_) => InterviewerTile()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: FutureBuilder<List<InterviewerTile>>(
            future: getInterviewerData(),
            builder: (context, AsyncSnapshot<List<InterviewerTile>> snapshot) {
              if (snapshot.hasError) {
                return Container(
                  child: Center(
                    child: Text("Loading"),
                  ),
                );
              } else if (snapshot.hasData) {
                return InterviewersPage(snapshot.data!);
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            }),
      ),
    );
  }
}
