import 'package:flutter/material.dart';
import 'package:template/TaskListItem.dart';
import "AddTaskView.dart";
import "package:provider/provider.dart";
import "TaskFilter.dart";

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
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){
            showDialog(context: context,
                builder: (BuildContext context) => filterDialog(context, filterModel),);
          })
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskView()));
        },
        
        child: Icon(Icons.add),
      ),
    );
  }

      Widget filterDialog(BuildContext context, TaskFilterModel filterModel) {
        return SimpleDialog(
          title: Text("Filter"),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                filterModel.setFilter(TaskFilter.All);
                Navigator.pop(context);
              },
              child: const Text('All'),
            ),
            SimpleDialogOption(
              onPressed: () {
                filterModel.setFilter(TaskFilter.Done);
                Navigator.pop(context);
              },
              child: const Text('Done'),
            ),
            SimpleDialogOption(
              onPressed: () {
                filterModel.setFilter(TaskFilter.Undone);
                Navigator.pop(context);
              },
              child: const Text('Undone'),
            ),
          ],
        );
      }
  } 
