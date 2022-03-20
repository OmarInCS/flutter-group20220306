
import 'package:flutter/material.dart';
import 'package:group20220306/toggl_clone/widgets/app_drawer.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Projects"
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
