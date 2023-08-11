import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';

class Question extends StatelessWidget {
  final String questionText;
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        questionText,
        style: TextStyle(
            fontSize: 18,
            color: isSwitched == false ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
