import 'package:flutter/material.dart';
import 'package:quizapp/style_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                )
              ]
            ),
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 200,
              color: const Color.fromARGB(146, 226, 209, 209),
            ),
          ),

          //  Opacity( // used to add oppacity to an image
          //   opacity: 0.2,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 200,
          //   ),
          // ),
          SizedBox(height: 20),
          StyleText("Learn Flutter The Fun Way", 18),
          SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                iconColor: Colors.white,
                side: BorderSide(color: Colors.white, width: 2)),
            label: StyleText("Start Quiz", 12),
            icon: Icon(
              Icons.arrow_right_alt,
            ),
          )
        ],
      ),
    );
  }
}
