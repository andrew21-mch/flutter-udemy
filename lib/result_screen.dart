import 'package:flutter/material.dart';
import 'package:quizapp/style_text.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          children: [
            StyleText("You Answered x out of y questions correctly", 14),
            SizedBox(
              height: 30,
            ),
            ...chosenAnswers.map((answer) {
              return StyleText(answer, 12);
            }),
            SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: StyleText("Restart Quiz", 12))
          ],
        ),
      ),
    );
  }
}
