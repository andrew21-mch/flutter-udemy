import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});
  // GradientContainer({key}): super(key: key);
  final List<Color> colors;


  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Center(
        child: DiceRoller()
      ),
    );
  }
}
