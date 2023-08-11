import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';

class Answer extends StatelessWidget {
  final String answersText;
  final Function() x;
  Answer(this.x,this.answersText);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:  ButtonStyle(
            fixedSize: const MaterialStatePropertyAll(Size(300, 30)),
            backgroundColor:
                MaterialStatePropertyAll(isSwitched==false? const Color.fromARGB(255, 30, 5, 39):Colors.white)),
        onPressed: x,
        child: Text(
          answersText,
          style: TextStyle(fontSize: 16 , color: isSwitched==false? Colors.white: Colors.black),
        ));
  }
}
