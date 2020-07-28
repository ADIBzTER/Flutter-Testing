import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function question;
  final String answer;
  Answer(this.question, this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answer),
        onPressed: question,
      ),
    );
  }
}
