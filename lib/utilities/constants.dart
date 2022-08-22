import 'package:flutter/material.dart';

const kInterviewers = Text(
  'Interviewers',
  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
);

const kFocusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: BorderSide.none,
);
const kEnabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: BorderSide.none,
);
const kNextButtonContainerDecoration = BoxDecoration(
  color: Color.fromARGB(151, 211, 212, 216),
);

const kADDEDstyle = TextStyle(
    fontSize: 12,
    color: Color.fromARGB(255, 116, 114, 114),
    fontWeight: FontWeight.bold);

const kSelectedInterviewers = Text(
  'Selected Interviewers',
  style: TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 24,
  ),
);
