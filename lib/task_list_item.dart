import 'dart:math';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";

class TaskListItemState extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String taskText) {
    _tasks.add(Task(taskText: taskText));
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}

class Task {
  final String taskText;
  bool isDone;

  Task({required this.taskText, this.isDone = false});
}

class TaskListItem extends StatelessWidget {
  final Task task;
  final VoidCallback onRemove;

  final List<String> congratulatoryMessages = [ //detta är 100% nödvändigt
    'Kingen!',
    'Fan va bra!',
    'Du är bäst!',
    'Boom! bam!',
    "Jag vill va som dig när jag blir stor!",
    "Coolast i stan!",
    "Daaamn, snyggt!"
  ];

  TaskListItem({required this.task, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.isDone,
        onChanged: (bool? value) {
          task.isDone = value!;
          Provider.of<TaskListItemState>(context, listen: false)
              .notifyListeners();

          if (task.isDone) {
            final random = Random();
            final index = random.nextInt(congratulatoryMessages.length);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(congratulatoryMessages[index]),
                duration: Duration(seconds: 1),
              ),
            );
          }
        },
      ),
      title: Text(
        task.taskText,
        style: TextStyle(
          fontSize: 18,
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.close),
        onPressed: onRemove,
      ),
    );
  }
}
