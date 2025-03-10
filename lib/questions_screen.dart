import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/style_text.dart';

import 'package:quizapp/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex = 0;

  void answerQuestion(){
    setState(() {
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    currentQuestionIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {

    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: SizedBox(
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(currentQuestion.text, style: GoogleFonts.lato(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 193, 118, 206)
                
                ),),
              ),
              SizedBox(
                height: 30,
              ),
              ...currentQuestion.getShuffledAnswers().map((answer){
                return Container(

                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                  child: AnswerButton(answer, answerQuestion)
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
