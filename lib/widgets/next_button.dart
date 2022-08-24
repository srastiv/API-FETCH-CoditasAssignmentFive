import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Interviewer_count_Provider.dart';
import '../screens/chosen_interviewer.dart';

class theNEXTbutton extends StatelessWidget {
  const theNEXTbutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => ChosenInterviewer()),
          ),
        );
        Provider.of<InterviewerCountProvider>(context, listen: false);
      },
      style: ElevatedButton.styleFrom(
        shadowColor: Color.fromARGB(255, 47, 146, 80),
        primary: Color.fromARGB(255, 47, 146, 80),
      ),
      child: const Text(
        'NEXT',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
