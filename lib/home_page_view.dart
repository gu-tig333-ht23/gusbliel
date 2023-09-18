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
    var selectedFilterString = filterModel.selectedFilter.toString().substring(11);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TIG333 TODO"),
        actions: [
          //Här kan användaren sätta ett filter på task listan.
          PopupMenuButton<TaskFilter>(
            icon: Text("Showing $selectedFilterString", style: TextStyle(fontSize: 18),),
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
      //visar en fin gubbe som dansar och lite text om man inte laggt till några tasks. 
      body: filteredTasks
              .isEmpty && filterModel.selectedFilter == TaskFilter.All
          ? Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Text(
                    "Your todo list is empty",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "press + to add a task!",
                    style: TextStyle(fontSize: 25),
                  ),
                  Image.asset(
                    'assets/stickman-dancing.gif',
                    width: 284,
                    height: 408,
                  ),
                ]))
          //Här visas listan med tasks
          : ListView.builder(
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
      //knappen i nedre högra hörnet
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
