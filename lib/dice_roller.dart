import 'package:flutter/material.dart';
import 'package:first_app/styled_text.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  // var activeDiceImage = 'assets/images/dice-2.png';
  var currentDiceRole = 2;
  void play() {
    setState(() {
      currentDiceRole = randomizer.nextInt(6) +
          1; // not really optimal(its redundant), stores new random variable in each click
    });
  }

  @override
  build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/dice-$currentDiceRole.png', width: 120),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
          ),
          onPressed: play,
          child: StyledText("Play", Colors.white),
        )
      ],
    );
  }
}
