import 'dart:math';

import 'package:quizzler/question.dart';

class QuizBrain {
  static List<Question> questions = [
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Question(question: 'A slug\'s blood is green.', answer: true)
  ];

  int questionNumber;

  QuizBrain({int questionNumber = 0}){
    this.questionNumber = questionNumber;
  }

  void nextQuestion(){
    this.questionNumber = min(questions.length - 1, questionNumber + 1);
  }

  Question getCurrentQuestion(){
    return questions[questionNumber];
  }
}