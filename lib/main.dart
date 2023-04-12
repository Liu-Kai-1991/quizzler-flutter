import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';
import 'package:quizzler/quiz_brain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  QuizBrain quizBrain = new QuizBrain();

  void selectAnswer(bool selected) {
    Question question = quizBrain.getCurrentQuestion();
    setState(() {
      if (selected == question.answer) {
        print('right');
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
          size: 30,
        ));
      } else {
        print('wrong');
        scoreKeeper.add(Icon(Icons.close, color: Colors.red, size: 30));
      }
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getCurrentQuestion().text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        answerButton("True", true, Colors.green),
        answerButton("False", false, Colors.red),
        new LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          int num = (constraints.maxWidth / 30).floor();
          return Row(
              children: scoreKeeper.sublist(max(0, scoreKeeper.length - num)));
        })
      ],
    );
  }

  Widget answerButton(String text, bool answer, Color backgroundColor) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: TextButton(
          style: TextButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: backgroundColor),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            selectAnswer(answer);
          },
        ),
      ),
    );
  }
}