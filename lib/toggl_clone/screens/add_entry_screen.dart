
import 'package:flutter/material.dart';
import 'package:group20220306/toggl_clone/models/project.dart';
import 'package:group20220306/toggl_clone/models/time_entry.dart';
import 'package:intl/intl.dart';

class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({Key? key}) : super(key: key);

  @override
  _AddEntryScreenState createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  
  var _timeEntry = TimeEntry(DateTime.now(), "");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Time Entry"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Text(
                      DateFormat("MMM, dd").format(_timeEntry.startTime),
                    style: TextStyle(
                      fontSize: 36
                    ),
                  ),
                  onTap: () async {
                    var date = await showDatePicker(
                                context: context,
                                initialDate: _timeEntry.startTime,
                                firstDate: DateTime.now().subtract(Duration(days: 7)),
                                lastDate: DateTime.now(),
                                helpText: "Start Date"
                              );

                    if (date != null) {
                      _timeEntry.startTime = DateTime(date.year, date.month, date.day,
                          _timeEntry.startTime.hour,
                          _timeEntry.startTime.minute,
                      );
                      setState(() {

                      });
                    }
                  },
                ),
                GestureDetector(
                  child: Text(
                      DateFormat("HH:mm").format(_timeEntry.startTime),
                    style: TextStyle(
                        fontSize: 36
                    ),
                  ),
                  onTap: () async {
                    var time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      helpText: "Start Time"
                    );

                    if (time != null) {
                      _timeEntry.startTime = DateTime(
                        _timeEntry.startTime.year,
                        _timeEntry.startTime.month,
                        _timeEntry.startTime.day,
                        time.hour, time.minute
                      );
                      setState(() {

                      });
                    }

                  },
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Description"
              ),
              onChanged: (text) => _timeEntry.description = text,
            ),
            DropdownButtonFormField(
              value: _timeEntry.project?.projectName,
              onChanged: (project) {
                _timeEntry.project = project as Project;
              },
              items: [
                for (var p in Project.dummyProjects)
                  DropdownMenuItem(
                    child: Text(p.projectName),
                    value: p,
                  )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          helpText: "End Time"
          );

          if (time != null) {
            _timeEntry.endTime = DateTime(
                _timeEntry.startTime.year,
                _timeEntry.startTime.month,
                _timeEntry.startTime.day,
                time.hour, time.minute
            );

            TimeEntry.dummyEntries.add(_timeEntry);
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
