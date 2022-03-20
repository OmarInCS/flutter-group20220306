

import 'package:flutter/material.dart';


class HelloScreen extends StatefulWidget {
  const HelloScreen({Key? key}) : super(key: key);

  @override
  _HelloScreenState createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {

  var _message = "Hello, Guest";
  var _tfController = TextEditingController();

  void _sayHello() {
    var name = _tfController.text;
    _message = "Hello, $name";
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_message),
          TextField(
            controller: _tfController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "Enter your name"
            ),
          ),
          SizedBox(height: 16,),
          ElevatedButton(
            child: Text("Click Me"),
            onPressed: _sayHello,
          )
        ],
      ),
    );
  }
}


