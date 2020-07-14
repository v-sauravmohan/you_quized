import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';
import 'score_keeper.dart';

QuizBrain quizBrain = QuizBrain();

class QuizPage extends StatefulWidget {
  void resetQuizPage() {
    quizBrain.resetQuizBrain();
  }

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  ScoreKeeper scoreKeeper = ScoreKeeper(quizBrain.getNumberOfQuestions());

  void checkAnswer(bool userPickerAnswer, BuildContext context) {
    bool isAnswerCorrect =
        quizBrain.getQuestionAnswerValue() == userPickerAnswer;
    setState(() {
      if (quizBrain.isEndOfQuiz()) {
        _onEndOfQuizAlert(context);
        scoreKeeper.resetScoreTracker();
        quizBrain.resetQuizBrain();
      } else {
        scoreKeeper.assignIconScoreKeeper(isAnswerCorrect);
        quizBrain.nextQuestion();
      }
    });
  }

  void _onEndOfQuizAlert(BuildContext context) {
    final alertStyle = AlertStyle(
        animationType: AnimationType.grow,
        isCloseButton: false,
        isOverlayTapDismiss: false,
        backgroundColor: Colors.grey[900],
        descStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        titleStyle: TextStyle(
          color: Colors.white,
        ));
    String totalScore = scoreKeeper.getTotalScore();
    Alert(
        context: context,
        type: AlertType.success,
        title: 'End Of Quiz',
        desc: 'You have Scored $totalScore',
        style: alertStyle,
        buttons: [
          DialogButton(
            color: Colors.green,
            child: Text(
              'OK',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      quizBrain.getQuestionText(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    textColor: Colors.white,
                    color: Colors.green,
                    child: Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(true, context);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    color: Colors.red,
                    child: Text(
                      'False',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(false, context);
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: scoreKeeper.getScoreTracker(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
