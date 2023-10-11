import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'get_todos_from_api.dart';

//Used to create a ListTile widget, with a checkbox, title and remove button.
class TodoListWidget extends StatelessWidget {
  final Todo todo;
  final VoidCallback onRemove;
  final BuildContext context;

  final List<String> todoDoneMessages = [
    // This is 100% necessary
    'King!',
    'You are the best!',
    'Boom! Bam!',
    'I want to be like you when I grow up!',
    'Coolest in town!',
    'Daaamn, nice!',
    'Legend!',
    'Absolute legend!',
    'You are on fire!'
  ];

  TodoListWidget(
      {required this.todo, required this.onRemove, required this.context});

  @override
  Widget build(BuildContext context) {
    var todoState = Provider.of<TodoState>(context);
    return ListTile(
      leading: Checkbox(
        value: todo.done,
        onChanged: (bool? value) async {
          todo.done = value!;
          await updateTodoDoneStatus(todo);
          await todoState.fetchTodos(); 
          if (todo.done) {
            final random = Random();
            final index = random.nextInt(todoDoneMessages.length);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(todoDoneMessages[index]),
                duration: Duration(seconds: 1),
              ),
            );
          }
        },
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          fontSize: 18,
          decoration: todo.done ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.close),
        onPressed: onRemove,
      ),
    );
  }
}
