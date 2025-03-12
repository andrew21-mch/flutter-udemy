import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_summary.dart';
import 'package:quizapp/style_text.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.onRestart, {super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  final void Function() onRestart;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      height: double.infinity,
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyleText(
                "You Answered $numCorrectQuestions out of $numTotalQuestions questions correctly",
                14),
            SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: onRestart,
              icon: Icon(Icons.restart_alt_outlined, color: Colors.white),
              label: StyleText("Restart Quiz", 12),
              style: OutlinedButton.styleFrom(
                iconColor: Colors.white,
                side: BorderSide(color: Colors.white, width: 2),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
