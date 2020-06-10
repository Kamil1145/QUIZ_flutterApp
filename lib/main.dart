import 'package:flutter/material.dart';
import 'package:flutter_proj_1/question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'Stolica Polski',
        'answers': ['Warszawa', 'Krakow', 'Poznan', 'Lodz'],
      },
      {
        'questionText': 'Podaj liczbe pierwsza',
        'answers': ['2', '4', '7', '9'],
      },
      {
        'questionText': 'Ktore to owoc',
        'answers': ['cebula', 'pomidor', 'truskawka', 'rzepa'],
      },
    ];
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My first app'),
      ),
      body: Column(
        children: [
          Question(
            questions[_questionIndex]['questionText'],
          ),
          ...(questions[_questionIndex]['answers'] as List<String>)
              .map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList()
        ],
      ),
    ));
  }
}
