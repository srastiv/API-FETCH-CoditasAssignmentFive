import 'package:coditas_assignment_5_api/screens/chosen_interviewer.dart';
import 'package:flutter/material.dart';
import 'package:coditas_assignment_5_api/models/InterviewTile_data_model.dart';

class InterviewerCountProvider with ChangeNotifier {
  int _addedInterviewerCount = 0;
  var selectedInterviewer;

  addRemoveInterviewer(InterviewerTile interviewer) {
    if (interviewer.added) {
      interviewer.added = false;
      _addedInterviewerCount--;
    } else {
      interviewer.added = true;
      _addedInterviewerCount++;
    }
    notifyListeners();
  }

  getInterviewerCount() {
    return _addedInterviewerCount;
  }
}
