import 'package:flutter/material.dart';
import 'package:group20220306/guess_game.dart';
import 'package:group20220306/hellp_app.dart';
import 'package:group20220306/quiz_app/quiz_home_screen.dart';
import 'package:group20220306/toggl_clone/screens/toggl_home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: TextStyle(
                fontSize: 32,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              )
          ),
        ),
        cardTheme: CardTheme(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Colors.blueGrey,
              width: 2
            )
          )
        )
      ),
      // home: HelloScreen(),
      // home: GuessGameScreen(),
      // home: QuizHomeScreen(),
      home: TogglHomeScreeen(),
    );
  }
}
