

import 'package:flutter/material.dart';
import 'package:group20220306/toggl_clone/screens/projects_screen.dart';
import 'package:group20220306/toggl_clone/screens/reports_screen.dart';
import 'package:group20220306/toggl_clone/screens/toggl_home_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            child: Text("Toggl Clone",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue
            ),
          ),
          ListTile(
            leading: Icon(Icons.timer),
            title: Text("Time Tracker"),
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TogglHomeScreeen(),)),
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text("Projects"),
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProjectsScreen(),)),
          ),
          ListTile(
            leading: Icon(Icons.receipt),
            title: Text("Reports"),
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ReportsScreen(),)),
          ),

        ],
      ),
    );
  }
}
