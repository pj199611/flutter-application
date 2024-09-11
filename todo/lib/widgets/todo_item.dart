import "package:flutter/material.dart";
import "package:todo/models/todo.dart";

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.todoItem});

  final TodoModel todoItem;
  @override
  State<TodoItem> createState() {
    return _TodoItemState();
  }
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
      return const Text('Todo Item');
  }
}
