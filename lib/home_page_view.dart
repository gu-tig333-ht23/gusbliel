import 'package:flutter/material.dart';
import 'package:template/task_list_item.dart';
import 'add_task_view.dart';
import "package:provider/provider.dart";
import 'task_filter.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var taskState = Provider.of<TaskListItemState>(context);
    var filterModel = Provider.of<TaskFilterModel>(context);
    List<Task> filteredTasks = filterModel.applyFilter(taskState.tasks);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TIG333 TODO"),
        actions: [
          PopupMenuButton<TaskFilter>(
            onSelected: (filter) {
              filterModel.setFilter(filter);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: TaskFilter.All,
                child: Text('All'),
              ),
              PopupMenuItem(
                value: TaskFilter.Done,
                child: Text('Done'),
              ),
              PopupMenuItem(
                value: TaskFilter.Undone,
                child: Text('Undone'),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredTasks.length,
        itemBuilder: (context, index) {
          final task = filteredTasks[index];
          return TaskListItem(
            task: task,
            onRemove: () {
              taskState.removeTask(task);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTaskView()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
