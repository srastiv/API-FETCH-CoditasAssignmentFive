import 'package:coditas_assignment_5_api/models/InterviewTile_data_model.dart';
import 'package:coditas_assignment_5_api/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/Interviewer_count_Provider.dart';
import '../widgets/next_button.dart';

class InterviewersPage extends StatefulWidget {
  List<InterviewerTile> initialListFromAPI;
  InterviewersPage(this.initialListFromAPI);
  @override
  State<InterviewersPage> createState() => _InterviewersPageState();
}

List<InterviewerTile> tempList = [];

class _InterviewersPageState extends State<InterviewersPage> {
  @override
  void initState() {
    List<InterviewerTile> tempList = widget.initialListFromAPI;
    super.initState();
  }

  searchInterviewer(query) {
    List<InterviewerTile> resultsList = widget.initialListFromAPI.where((e) {
      final interviewerFirst = e.name.first.toLowerCase().contains(
            query.toLowerCase(),
          );
      final interviewerLast = e.name.last.toLowerCase().contains(
            query.toLowerCase(),
          );
      return interviewerFirst || interviewerLast;
    }).toList();
    setState(() {
      tempList = resultsList;
    });

    print(resultsList[0].name.last);
    return resultsList;
  }

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
                      onChanged: searchInterviewer,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: kFocusedBorder,
                        enabledBorder: kEnabledBorder,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          onPressed: () {},
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
                  child: tempList.length == 0
                      ? Center(
                          child: Text(
                            'Enter a valid search query',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        )
                      : ListView.builder(
                          itemCount: tempList.length,
                          itemBuilder: (context, index) {
                            // int startIndex =
                            //     tempList[index].name.first.toLowerCase().indexOf(searchInterviewer(context).toLowerCase());
                            return ListTile(
                              trailing: TextButton(
                                onPressed: () {
                                  //debugPrint('add-remove button pressed');
                                  Provider.of<InterviewerCountProvider>(context,
                                          listen: false)
                                      .addRemoveInterviewer(tempList[index]);
                                },
                                child: tempList[index].added
                                    ? const Text(
                                        "REMOVE",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            decoration:
                                                TextDecoration.underline),
                                      )
                                    : const Text(
                                        "ADD",
                                        style: TextStyle(
                                            color: Colors.black,
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                              ),
                              subtitle: Text(
                                tempList[index].cell,
                                style: TextStyle(
                                    color: tempList[index].added
                                        //widget.initialListFromAPI[index].added
                                        ? Colors.blue
                                        : Colors.black),
                              ),
                              title: RichText(
                                text: TextSpan(
                                  text:
                                      '${tempList[index].name.title}. ${tempList[index].name.first} ${tempList[index].name.last}',
                                  style: TextStyle(
                                      color: tempList[index].added
                                          ? Colors.blue
                                          : Colors.black),
                                ),
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
                      child: theNEXTbutton(),
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
