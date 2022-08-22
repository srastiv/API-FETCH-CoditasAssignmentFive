import 'package:flutter/material.dart';

class ChosenInterviewer extends StatelessWidget {
  ChosenInterviewer({Key? key}) : super(key: key);
  //ChosenInterviewer element = ChosenInterviewer();
  @override
  Widget build(BuildContext context) {
    // List<InterviewerTile> listOfInterviewers;
    // List<InterviewerTile> selectedInterviewers = [];
    // for (int i = 0; i <= listOfInterviewers.length; i++) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 211, 212, 216),
        appBar: AppBar(
          title: Text('Selected Interviewers'),
          backgroundColor: Color.fromARGB(255, 211, 212, 216),
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return ListTile(
                subtitle: Text(
                  'chosen',
                  style: TextStyle(color: Colors.black),
                ),
                title: Text(
                  '',
                ),
              );
            }),
      ),
    );
  }
}
