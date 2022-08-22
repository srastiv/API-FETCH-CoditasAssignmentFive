import 'package:coditas_assignment_5_api/screens/chosen_interviewer.dart';
import 'package:coditas_assignment_5_api/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:coditas_assignment_5_api/data/interviewers_fetch.dart';
import 'package:provider/provider.dart';
import '../models/Interviewer_count_Provider.dart';

class InterviewersPage extends StatefulWidget {
  AsyncSnapshot snapshot;
  InterviewersPage(this.snapshot);
  @override
  State<InterviewersPage> createState() => _InterviewersPageState();
}

class _InterviewersPageState extends State<InterviewersPage> {
  @override
  void initState() {
    getInterviewerData();
    super.initState();
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
                        focusedBorder: kFocusedBorder,
                        enabledBorder: kEnabledBorder,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          onPressed: () {
                            debugPrint("search button pressed");
                          },
                          icon: const Icon(Icons.search),
                          color: Colors.grey.shade700,
                        ),
                        labelText: "Search Interviewers",
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(right: 300),
                    child: Text(
                      "${Provider.of<InterviewerCountProvider>(context).getInterviewerCount().toString()} ADDED",
                      style: kADDEDstyle,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 220,
                  child: ListView.builder(
                      itemCount: widget.snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          trailing: TextButton(
                            onPressed: () {
                              //debugPrint('add-remove button pressed');
                              Provider.of<InterviewerCountProvider>(context,
                                      listen: false)
                                  .addRemoveInterviewer(
                                      widget.snapshot.data![index]);
                            },
                            child: widget.snapshot.data![index].added
                                ? const Text(
                                    "REMOVE",
                                    style: TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.underline),
                                  )
                                : const Text(
                                    "ADD",
                                    style: TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.underline),
                                  ),
                          ),
                          subtitle: Text(
                            widget.snapshot.data![index].cell,
                            style: TextStyle(
                                color: widget.snapshot.data![index].added
                                    ? Colors.blue
                                    : Colors.black),
                          ),
                          title: Text(
                            '${widget.snapshot.data![index].name.title}. ${widget.snapshot.data![index].name.first} ${widget.snapshot.data![index].name.last}',
                            style: TextStyle(
                                color: widget.snapshot.data![index].added
                                    ? Colors.blue
                                    : Colors.black),
                          ),
                        );
                      }),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 60,
                    alignment: Alignment.bottomCenter,
                    decoration: kNextButtonContainerDecoration,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 280, bottom: 15),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => ChosenInterviewer()),
                            ),
                          );
                          Provider.of<InterviewerCountProvider>(context,
                              listen: false);
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
