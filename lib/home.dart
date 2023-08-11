import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

class home extends StatefulWidget {
  static const String id = "main";
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

bool isSwitched=false;

class _homeState extends State<home> {
  int questionIndex = 0;
  int totalscore=0;
  int lastscore=0;
  
  void answerQuestion(int score) {
    lastscore=score;
    totalscore+=score;
    setState(() {
      questionIndex += 1;
    });
  }

  void back(){
    totalscore-=lastscore;
    if (questionIndex-1==-1) {
      setState(() {
        questionIndex=0;
      });
    }
    else{
      setState(() {
        questionIndex-=1;
      });
    }
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalscore=0;
    });
  }

  final List<Map<String, Object>> questions = [
    {
      "question": "What's your favorate color?",
      "answer": [
        {"Text": "red", "score": 10},
        {"Text": "black", "score": 15},
        {"Text": "darkblue", "score": 20},
      ],
    },
    {
      "question": "What's your favorate animal?",
      "answer": [
        {"Text": "dog", "score": 3},
        {"Text": "cat", "score": 5},
        {"Text": "lion", "score": 2}
      ],
    },
    {
      "question": "What's your favorate film?",
      "answer": [
        {"Text": "jhon wick", "score": 15},
        {"Text": "hary potter", "score": 20},
        {"Text": "the punsher", "score": 20}
      ],
    },
    {
      "question": "What's your favorate football team?",
      "answer": [
        {"Text": "Alahly", "score": 20},
        {"Text": "barcelona", "score": 20},
        {"Text": "Man city", "score": 20}
      ],
    },
    {
      "question": "What's your faculty?",
      "answer": [
        {"Text": "computer science", "score": 30},
        {"Text": "Engineering", "score": 10},
        {"Text": "Medicen", "score": 5}
      ],
    },
    {
      "question": "What's your country?",
      "answer": [
        {"Text": "Egypt", "score": 5},
        {"Text": "Qatar", "score": 30},
        {"Text": "England", "score": 20}
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: isSwitched==false?Colors.white:Colors.black,
        appBar: AppBar(
          title: Text(
            "Quiz App",
            style: TextStyle(fontSize: 20,color: isSwitched==false ? Colors.white: Colors.black),
          ),
          actions: [

            Switch(value: isSwitched, onChanged: (value) {
              setState(() {
                isSwitched=value;
              });
            },)
          ],
          backgroundColor: isSwitched==false? const Color.fromARGB(255, 30, 5, 39):Colors.white,
        ),
        body: Center(
            child: questionIndex < questions.length
                ? Quiz(answerQuestion, questions, questionIndex,back)
                : Result(resetQuiz,totalscore),
                ),
      ),
    );
  }
}
