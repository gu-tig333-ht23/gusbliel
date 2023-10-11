import 'package:flutter/material.dart';
import 'package:template/todo_list_widget.dart';
import 'add_todo_view.dart';
import "package:provider/provider.dart";
import 'todo_filter.dart';
import 'get_todos_from_api.dart';

//creates the home page view where the user can view their todos and interact with them. 
class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var todofilter = Provider.of<TodoFilterState>(context);
    var todoState = Provider.of<TodoState>(context);
   

    List<Todo> filteredTodos = todofilter.applyFilter(todoState.todos);
    var selectedFilterString =
        todofilter.selectedFilter.toString().substring(11);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TIG333 TODO"),
        actions: [
          PopupMenuButton<TodoFilter>(
            icon: Text(
              "Showing $selectedFilterString",
              style: TextStyle(fontSize: 18),
            ),
            onSelected: (filter) {
              todofilter.setFilter(filter);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: TodoFilter.All,
                child: Text('All'),
              ),
              PopupMenuItem(
                value: TodoFilter.Done,
                child: Text('Done'),
              ),
              PopupMenuItem(
                value: TodoFilter.Undone,
                child: Text('Undone'),
              ),
            ],
          ),
        ],
      ),
      body: filteredTodos.isEmpty && todofilter.selectedFilter == TodoFilter.All
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
                    "press + to add a todo!",
                    style: TextStyle(fontSize: 25),
                  ),
                  Image.asset(
                    'assets/stickman-dancing.gif',
                    width: 284,
                    height: 408,
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: filteredTodos.length,
              itemBuilder: (context, index) {
                final todo = filteredTodos[index];
                return TodoListWidget(
                  todo: todo,
                  onRemove: () {
                    deleteTodo(todo);
                    //todoState.fetchTodos();
                  },
                  context: context,
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTodoView()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
