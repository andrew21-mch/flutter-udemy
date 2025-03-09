import 'package:flutter/material.dart';
import 'package:quizapp/style_text.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

  handlePress() {
    print('pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 200,
            ),
            SizedBox(height: 20),
            StyleText("Learn Flutter The Fun Way"),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: handlePress,
              child: StyleText('Get Started'),
            )
          ],
        ),
      ),
    );
  }
}
