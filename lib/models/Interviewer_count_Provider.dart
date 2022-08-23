import 'package:flutter/material.dart';
import 'package:coditas_assignment_5_api/models/InterviewTile_data_model.dart';

class InterviewerCountProvider with ChangeNotifier {
  int _addedInterviewerCount = 0;
  List selectedInterviewer = [];

  addRemoveInterviewer(InterviewerTile interviewer) {
    if (interviewer.added) {
      interviewer.added = false;
      _addedInterviewerCount--;
      selectedInterviewer.remove(interviewer);
    } else {
      interviewer.added = true;
      _addedInterviewerCount++;
      selectedInterviewer.add(interviewer);
    }
    notifyListeners();
  }

  getInterviewerCount() {
    return _addedInterviewerCount;
  }
}
