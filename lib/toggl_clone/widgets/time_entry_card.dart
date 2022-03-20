
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group20220306/toggl_clone/models/time_entry.dart';
import 'package:intl/intl.dart';

class TimeEntryCard extends StatelessWidget {

  TimeEntryCard(this.timeEntry, {Key? key}) : super(key: key);
  final TimeEntry timeEntry;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(timeEntry.description),
        subtitle: Text(timeEntry.project?.projectName ?? "No Project"),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat.Hm().format(timeEntry.startTime)
            ),
            SizedBox(height: 8,),
            Text(
                DateFormat.Hm().format(timeEntry.endTime!)
            ),
          ],
        ),
        trailing: Text(
          NumberFormat.currency(symbol: "SAR ").format(timeEntry.cost)
        ),
      ),
    );
  }
}
