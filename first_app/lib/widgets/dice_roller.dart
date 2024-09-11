import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDeviceImage = 'assets/images/dice-2.png';
  final randomizer = Random();

  void rollDice() {
    final int diceRoll = randomizer.nextInt(6) + 1;
    setState(() {
      activeDeviceImage = 'assets/images/dice-$diceRoll.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            activeDeviceImage,
            width: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            child: const Text(
              'Roll Dice',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
