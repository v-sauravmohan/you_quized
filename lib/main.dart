import 'package:flutter/material.dart';
import 'start_quiz.dart';

void main() => runApp(YouQuized());

class YouQuized extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartQuizPage(),
    );
  }
}
