import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChosenInterviewer extends StatelessWidget {
  const ChosenInterviewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 211, 212, 216),
        appBar: AppBar(
          title: Text('data'),
        ),
        body: Center(child: Text("This interviewer was chosen")),
      ),
    );
  }
}
