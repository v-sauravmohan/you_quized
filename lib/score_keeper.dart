import 'package:flutter/material.dart';

class ScoreKeeper {
  int _correctAnswers;
  int _wrongAnswers;
  int _numberOfQuestions;
  String _totalScore;
  List<Icon> _scoreTracker;

  ScoreKeeper(int numberOfQuestions) {
    _numberOfQuestions = numberOfQuestions;
    resetScoreTracker();
  }

  void resetScoreTracker() {
    _correctAnswers = 0;
    _wrongAnswers = 0;
    _scoreTracker = [];
  }

  void assignIconScoreKeeper(bool isAnswerCorrect) {
    if (_numberOfQuestions - 1 > _scoreTracker.length) {
      Icon answerIcon;
      switch (isAnswerCorrect) {
        case true:
          _correctAnswers++;
          answerIcon = Icon(
            Icons.check,
            color: Colors.green,
          );
          break;
        case false:
          _wrongAnswers++;
          answerIcon = Icon(
            Icons.close,
            color: Colors.red,
          );
          break;
      }
      _scoreTracker.add(answerIcon);
    }
  }

  List<Icon> getScoreTracker() {
    return _scoreTracker;
  }

  String getTotalScore() {
    _totalScore = '$_correctAnswers/$_numberOfQuestions';
    return _totalScore;
  }
}
