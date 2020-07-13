import 'package:flutter/material.dart';
import 'quiz-page.dart';

// ignore: must_be_immutable
class StartQuizPage extends StatelessWidget {
  QuizPage quizPage = QuizPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Center(
              child: FlatButton(
                color: Colors.red,
                child: Text(
                  'Start Quiz',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  quizPage.resetQuizPage();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => quizPage),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
