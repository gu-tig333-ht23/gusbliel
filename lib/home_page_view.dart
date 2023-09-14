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
        backgroundColor: Color.fromARGB(
            255, 255, 145, 175), //Theme primary color va inte tillräckligt fin
        title: Text("TIG333 TODO"),
        actions: [
          PopupMenuButton<TaskFilter>( //Här kan användaren sätta ett filter på task listan. 
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
      body: filteredTasks.isEmpty //Detta ska förbättras i framtiden för att fungera bättre i enlighet med filtret man väljer. 
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
          : ListView.builder( //Här visas listan med tasks
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
      floatingActionButton: FloatingActionButton( //knappen i nedre högra hörnet
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTaskView()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
