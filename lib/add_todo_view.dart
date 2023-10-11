import 'package:flutter/material.dart';
import 'get_todos_from_api.dart';
import "package:provider/provider.dart";

//Creates the add todo view where the user can add todos. 
class AddTodoView extends StatelessWidget {
  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var todoState = Provider.of<TodoState>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("TIG333 TODO"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              TextField(
                controller: _todoController,
                decoration: InputDecoration(
                  hintText: 'Enter todo name',
                ),
              ),
              SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  final newTodo = _todoController.text.trim();
                  if (newTodo.isNotEmpty) {
                    postTodo(Todo(title: newTodo));
                    _todoController.clear();
                    todoState.fetchTodos();
                    
                  }
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Color.fromARGB(255, 255, 145, 175),
                    content: Text("A todo has been added!"),
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
