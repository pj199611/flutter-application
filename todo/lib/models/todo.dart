enum Status { pending, started, completed }

class TodoModel {
  final String text;
  final Status status;

  const TodoModel({required this.text, required this.status});
}
