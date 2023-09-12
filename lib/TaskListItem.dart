import 'package:flutter/material.dart';
import "package:provider/provider.dart";

class TaskListItemState extends ChangeNotifier {
  Map<String, bool> _taskStates = {}; // Map to store task states

  bool getIsChecked(String taskText) {
    return _taskStates[taskText] ?? false; // Default to false if not found
  }

  void setIsChecked(String taskText, bool isChecked) {
    _taskStates[taskText] = isChecked;
    notifyListeners();
  }
}


class TaskListItem extends StatelessWidget {
  final String taskText;

  TaskListItem({required this.taskText});

  @override
  Widget build(BuildContext context) {
    var taskState = Provider.of<TaskListItemState>(context);

    return ListTile(
      leading: Checkbox(
        value: taskState.getIsChecked(taskText), // Use taskText as ID
        onChanged: (bool? value) {
          context.read<TaskListItemState>().setIsChecked(taskText, value!);
        },
      ),
      title: Text(
        taskText,
        style: TextStyle(
          fontSize: 18, 
          decoration: taskState.getIsChecked(taskText) ? TextDecoration.lineThrough : null,
          ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {},
      ),
    );
  }
}
