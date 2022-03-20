
import 'dart:math';
import 'package:flutter/material.dart';
// 05 99 888 921
class GuessGameScreen extends StatefulWidget {
  const GuessGameScreen({Key? key}) : super(key: key);

  @override
  _GuessGameScreenState createState() => _GuessGameScreenState();
}

class _GuessGameScreenState extends State<GuessGameScreen> {

  var _message = "Guess a number btw 0-100";
  var _textColor = Colors.red;
  var _imagePath = "assets/images/think.png";
  var _randGen = Random();
  // late int _number;
  var _number;
  var _tfController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _number = _randGen.nextInt(101);
  }

  void _checkAnswer([String? input]) {

    var guess = int.parse(_tfController.text);
    if (guess > _number) {
      _message = "Guess num. smaller than $guess";
    }
    else if (guess < _number) {
      _message = "Guess num. greater than $guess";
    }
    else {
      _message = "You Guess Right!!";
      _textColor = Colors.green;
      _imagePath = "assets/images/happy.png";
    }
    setState(() {

    });
  }

  void _resetGame() {
    _message = "Guess a number btw 0-100";
    _textColor = Colors.red;
    _number = _randGen.nextInt(101);
    _imagePath = "assets/images/think.png";
    _tfController.text = "";
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guess Game"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetGame,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_message,
              style: TextStyle(
                color: _textColor,
                fontSize: 24
              ),
            ),
            Image.asset(_imagePath),
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Eg.: 50, 75, 30"
              ),
              controller: _tfController,
              keyboardType: TextInputType.number,
              onSubmitted: _checkAnswer,
            ),
            ElevatedButton(
              child: Text("Check"),
              onPressed: _checkAnswer,
            )
          ],
        ),
      ),
    );
  }
}
