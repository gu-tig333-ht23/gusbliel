import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget {
  final String taskText;

  TaskListItem({required this.taskText});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(value: false, onChanged: null),
      title: Text(taskText, style: TextStyle(fontSize: 18),),
      trailing: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
        },
      ),
    );
  }
}