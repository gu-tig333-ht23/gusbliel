import 'dart:math';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";

//TaskListItemState används för att skapa en lista med tasks, samt för att kunna lägga till och ta bort tasks från denna lista. 
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
//Task används för att skapa tasks 
class Task {
  final String taskText;
  bool isDone;

  Task({required this.taskText, this.isDone = false});
}

//TaskListItem används för att skapa en task widget som har en checkbox och ett kryss, samt fuctionaliteten för dessa. 
class TaskListItem extends StatelessWidget {
  final Task task;
  final VoidCallback onRemove;

final List<String> taskDoneMessages = [
  // This is 100% necessary
  'King!',
  'You are the best!',
  'Boom! Bam!',
  'I want to be like you when I grow up!',
  'Coolest in town!',
  'Daaamn, nice!',
  'Legend!',
  'Absolute legend!',
  'You are on fire!',
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
            final index = random.nextInt(taskDoneMessages.length);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                //backgroundColor: Color.fromARGB(255, 255, 145, 175),
                content: Text(taskDoneMessages[index]),
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
