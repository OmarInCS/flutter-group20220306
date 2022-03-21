
import 'package:flutter/material.dart';
import 'package:group20220306/toggl_clone/models/time_entry.dart';
import 'package:group20220306/toggl_clone/screens/add_entry_screen.dart';
import 'package:group20220306/toggl_clone/widgets/app_drawer.dart';
import 'package:group20220306/toggl_clone/widgets/time_entry_card.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class TogglHomeScreeen extends StatefulWidget {
  const TogglHomeScreeen({Key? key}) : super(key: key);

  @override
  _TogglHomeScreeenState createState() => _TogglHomeScreeenState();
}

class _TogglHomeScreeenState extends State<TogglHomeScreeen> {

  var actionIcon = Icon(Icons.add);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
      ),
      drawer: AppDrawer(),
      body: GroupedListView(
        elements: TimeEntry.dummyEntries,
        groupBy: (TimeEntry element) => DateFormat.yMEd().format(element.startTime),
        groupSeparatorBuilder: (String day) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              day
          ),
        ),
        itemBuilder: (context, TimeEntry element) => TimeEntryCard(element),
      ),
      floatingActionButton: FloatingActionButton(
        child: actionIcon,
        onPressed: () {

          if (actionIcon.icon == Icons.add) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddEntryScreen(),))
                      .then((value) {
              setState(() {

              });
            });
          }

        },
      ),
    );
  }
}
