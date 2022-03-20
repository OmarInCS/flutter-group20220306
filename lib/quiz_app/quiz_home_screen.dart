
import 'package:flutter/material.dart';
import 'package:group20220306/quiz_app/quiz_screen.dart';

class QuizHomeScreen extends StatelessWidget {
  const QuizHomeScreen({Key? key}) : super(key: key);

  static const _levels = ["Easy", "Normal", "Hard"];

  @override
  Widget build(BuildContext context) {

    var isWideScreen = MediaQuery.of(context).orientation == Orientation.landscape;
    var buttons = [
      for (var level in _levels)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(level),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen(level: level,),));
            },
          ),
        ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: isWideScreen ?
        Center(
          child: Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: buttons,
          ),
        )
      : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons,
      ),
    );
  }
}
