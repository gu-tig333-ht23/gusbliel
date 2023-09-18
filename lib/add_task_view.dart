import 'package:flutter/material.dart';
import 'package:template/task_list_item.dart';
import 'package:provider/provider.dart';

class AddTaskView extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var taskState = Provider.of<TaskListItemState>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("TIG333 TODO"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              TextField(
                controller: _taskController,
                decoration: InputDecoration(
                  hintText: 'Enter task name',
                ),
              ),
              SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  final newTask = _taskController.text.trim();
                  if (newTask.isNotEmpty) {
                    taskState.addTask(newTask);
                    _taskController.clear();
                  }
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Color.fromARGB(255, 255, 145, 175),
                    content: Text("A task has been added!"),
                    duration: Duration(seconds: 2),
                  ));
                },
                child: Text(
                  '+ ADD',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ])));
  }
}
