import 'package:flutter/material.dart';
import 'package:template/TaskListItem.dart';
import "AddTaskView.dart";
import "package:provider/provider.dart";

class HomePageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var taskState = Provider.of<TaskListItemState>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TIG333 TODO"),
        actions: [
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){
            showDialog(context: context, builder: (BuildContext context) => filterDialog(context));
          })
        ],
        
      ),
      body: ListView.builder(
        itemCount: taskState.tasks.length,
        itemBuilder: (context, index) {
          final task = taskState.tasks[index];
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

  Widget filterDialog(BuildContext context){
    return
    SimpleDialog(
      
      title: Text("Filter"),
      children: <Widget>[
        SimpleDialogOption(
            onPressed: () {},
            child: const Text('All'),
          ),
        SimpleDialogOption(
            onPressed: () {},
            child: const Text('Done'),
          ),          
        SimpleDialogOption(
            onPressed: () {},
            child: const Text('Undone'),
          )
      ]        
      
      );
  }
}