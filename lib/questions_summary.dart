import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: summaryData.map((data) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    width: 35, 
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: data['correct_answer'] == data['user_answer'] ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          textAlign: TextAlign.start,
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 226, 224, 224)),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${data['user_answer']}',
                          textAlign: TextAlign.start,
                          style: const TextStyle(color: Color.fromARGB(255, 221, 86, 214)),
                        ),
                        Text(
                          '${data['correct_answer']}',
                          textAlign: TextAlign.start,
                          style: const TextStyle(color: Color.fromARGB(255, 33, 187, 41)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
