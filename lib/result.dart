import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';

class Result extends StatelessWidget {
  final int totalscore;

  final Function() resetQuiz;

  Result(this.resetQuiz, this.totalscore);

  String get statusScore {
    String statusText = "";
    if (totalscore == 57) {
      statusText = "You are not like me";
    } else if (totalscore == 125) {
      statusText = "sure u are my partner";
    } else if (totalscore > 57 && totalscore < 125) {
      statusText = "You are my friend";
    }
    return statusText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          "Done !",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: isSwitched==false? Colors.black: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Your score is $totalscore\nYour status: $statusScore",
          style:  TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: isSwitched==false? Colors.black:Colors.white),
        ),
        const SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: resetQuiz,
          child: const Text(
            "Reset the quiz",
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
