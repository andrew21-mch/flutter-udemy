import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 36, 6, 88),
          body: GradientContainer(
            [const Color.fromARGB(255, 5, 0, 19), const Color.fromARGB(255, 149, 57, 192)]
          )),
    ),
  );
}

