import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';
import 'answers.dart';
import 'questions.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function(int score) answerQuestion;
  final Function() back;

  Quiz(this.answerQuestion, this.questions, this.questionIndex, this.back);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Question(questions[questionIndex]['question'].toString()),
        const SizedBox(
          height: 30,
        ),
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
            .map((value) {
          return Column(
            children: [
              Answer(() => answerQuestion(int.parse(value["score"].toString())),
                  value["Text"].toString()),
              const SizedBox(
                height: 15,
              ),
            ],
          );
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 15,
            ),
            TextButton(
              onPressed: back,
              child:  Text("back",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:isSwitched==false? const Color.fromARGB(255, 30, 5, 39):Colors.white ,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
