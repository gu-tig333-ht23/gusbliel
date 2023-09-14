import 'package:flutter/material.dart';
import "package:provider/provider.dart";

class TaskListItemState extends ChangeNotifier {
  List<Task> _tasks = [];

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

  TaskListItem({required this.task, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.isDone,
        onChanged: (bool? value) {
          task.isDone = value!;
          Provider.of<TaskListItemState>(context, listen: false).notifyListeners();
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

