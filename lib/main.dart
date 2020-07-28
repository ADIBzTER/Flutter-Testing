import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _index = 0;
  void _answerQuestions() {
    setState(() {
      _index++;
    });
  }

  void _reset() {
    setState(() => _index = 0);
  }

  @override
  Widget build(BuildContext context) {
    const _questions = const [
      {
        "questionText": "Where is mom?",
        "answer": ["IDK", "Garden", "Toilet"],
      },
      {
        "questionText": "Eat What?",
        "answer": ["Chicken", "Duck", "Loli"],
      },
      {
        "questionText": "Manoi?",
        "answer": ["Gomeh", "Pilah", "Entah"],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
        ),
        body: (_index < _questions.length)
            ? Column(
                children: [
                  Question(
                    _questions[_index]["questionText"],
                  ),
                  ...(_questions[_index]["answer"] as List<String>)
                      .map((answer) => Answer(_answerQuestions, answer))
                      .toList()
                ],
              )
            : Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      "You Did It Bro!!",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        "Again!!!",
                        style: TextStyle(fontSize: 23)
                      ),
                      onPressed: _reset,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
