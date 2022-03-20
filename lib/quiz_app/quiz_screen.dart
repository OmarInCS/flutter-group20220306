
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key, this.level = "Easy"}) : super(key: key);
  final String level;

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  var _randGen = Random();
  var _x, _y;
  var _choices = [];
  var _colors = [Colors.green, Colors.red, Colors.blue, Colors.deepOrangeAccent];
  var _count = 0, _correct = 0;
  var _timer, _seconds;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _generateQuestion();
    _initTimer();
  }

  void _generateQuestion() {
    _count++;
    _x = _randGen.nextInt(11);
    _y = _randGen.nextInt(11);

    _choices = [];
    _choices.add(_x * _y);
    for (int i = 0; i < 3; i++) {
      _choices.add(_randGen.nextInt(101));
    }

    _choices.shuffle();
  }

  void _checkChoice(int i) {
    var answer = _choices[i];
    String message;
    if (answer == _x * _y) {
      message = "Correct Answer";
      _correct++;
    }
    else {
      message = "Wrong Answer";
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    ));

    _checkEndOfQuestions();
  }

  void _checkEndOfQuestions() {

    if (_count < 5) {
      _generateQuestion();
      _timer.cancel();
      _initTimer();
      setState(() {

      });
    }
    else {
      _timer.cancel();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Tour Score"),
          content: Text("Your score is: $_correct out of 5"),
          actions: [
            TextButton(
              child: Text("Ok"),
              onPressed: () => Navigator.popUntil(context, ModalRoute.withName("/")),
            )
          ],
        ),
      );
    }

  }

  void _initTimer() {
    if (widget.level == "Easy") {
      _seconds = 30;
    }
    else if (widget.level == "Normal") {
      _seconds = 15;
    }
    else {
      _seconds = 5;
    }

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {

      if (_seconds == 0) {
        _checkEndOfQuestions();
        _initTimer();
      }
      else {
        _seconds--;
        setState(() {

        });
      }

    });
  }

  @override
  Widget build(BuildContext context) {

    var isWideScreen = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "What's $_x * $_y ?",
            style: TextStyle(
              fontSize: 36
            ),
          ),
          Text("$_seconds",
            style: TextStyle(
                fontSize: 32
            ),
          ),
          GridView.builder(
            itemCount: _choices.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isWideScreen ? 4 : 2,
              childAspectRatio: 3 / 2
            ),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text("${_choices[index]}"),
                onPressed: () {
                  _checkChoice(index);
                },
                style: ElevatedButton.styleFrom(
                  primary: _colors[index]
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
