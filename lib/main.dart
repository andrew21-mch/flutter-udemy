import 'package:flutter/material.dart';
import 'package:quizapp/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 2, 49, 87),
        body: GradientContainer([ Color.fromARGB(255, 10, 46, 109), const Color.fromARGB(255, 2, 94, 117)])
      ),
    ),
  );
}
