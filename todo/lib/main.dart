import "package:flutter/material.dart";
import "package:todo/widgets/todo.dart";

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Todo',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: Todo(),
        ),
      ),
    );
  }
}
