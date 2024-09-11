import "package:flutter/material.dart";
import 'package:first_app/widgets/gardient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colors: [
            Color.fromARGB(255, 55, 17, 121),
            Color.fromARGB(255, 103, 86, 133),
          ],
        ),
      ),
    ),
  );
}
