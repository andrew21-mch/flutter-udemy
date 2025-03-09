import 'package:flutter/material.dart';

class SimpleWidget extends StatelessWidget {
  const SimpleWidget(this.text, {super.key});

  final String text;
  @override
  build(context) {
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 30),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
