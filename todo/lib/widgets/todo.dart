import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/todo_item.dart';
import 'package:todo/data/todos.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  var List<TodoModel> todos;

  @override
  State<Todo> createState() {
    return _TodoState();
  }
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: widget.todos.length,
      itemBuilder: (BuildContext context, int index) {
        return TodoItem(todoItem: widget.todos[index]);
      },
    );
  }
}
