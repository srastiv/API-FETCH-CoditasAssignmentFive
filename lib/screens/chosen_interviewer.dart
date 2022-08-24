import 'package:coditas_assignment_5_api/models/Interviewer_count_Provider.dart';
import 'package:coditas_assignment_5_api/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Interviewer_count_Provider.dart';

class ChosenInterviewer extends StatelessWidget {
  ChosenInterviewer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 211, 212, 216),
        appBar: AppBar(
          title: kSelectedInterviewers,
          backgroundColor: Color.fromARGB(255, 211, 212, 216),
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount:
                Provider.of<InterviewerCountProvider>(context, listen: false)
                    .selectedInterviewer
                    .length,
            itemBuilder: (context, index) {
              return ListTile(
                subtitle: Text(
                  '${Provider.of<InterviewerCountProvider>(context, listen: false).selectedInterviewer[index].cell.toString()} ',
                  style: TextStyle(color: Colors.black),
                ),
                title: Text(
                  '${Provider.of<InterviewerCountProvider>(context, listen: false).selectedInterviewer[index].name.title.toString()} ${Provider.of<InterviewerCountProvider>(context, listen: false).selectedInterviewer[index].name.first.toString()} ${Provider.of<InterviewerCountProvider>(context, listen: false).selectedInterviewer[index].name.last.toString()}',
                ),
              );
            }),
      ),
    );
  }
}
