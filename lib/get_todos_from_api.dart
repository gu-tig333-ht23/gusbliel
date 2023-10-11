import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String ENDPOINT = "https://todoapp-api.apps.k8s.gu.se";
String APIKEY = "b6d3c538-b224-43e2-bc3b-ae31f96845a8";

class Todo {
  String? id;
  final String title;
  bool done;

  Todo({
    this.id,
    required this.title,
    this.done = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"],
      title: json["title"],
      done: json["done"],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonMap = {
      "title": title,
      "done": done,
    };
    if (id != null) {
      jsonMap["id"] = id;
    }
    return jsonMap;
  }
}

class TodoState extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<List<Todo>> fetchTodos() async {
  var todos = await getTodo();
  _todos = todos;
  notifyListeners();
  return todos;
}

}

Future<List<Todo>> getTodo() async {
  http.Response response =
      await http.get(Uri.parse("$ENDPOINT/todos?key=$APIKEY"));

  String body = response.body;

  List<dynamic> todosJson = jsonDecode(body);

  return todosJson.map((json) => Todo.fromJson(json)).toList();
}

void postTodo(Todo todo) async {
  Map<String, dynamic> jsonBody = todo.toJson();
  jsonBody.remove("id");

  await http.post(
    Uri.parse("$ENDPOINT/todos?key=$APIKEY"),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(jsonBody),
  );
}

//This is called when checkboxes are pressed in order to mark the done status correctly. 
void updateTodoDoneStatus(Todo todo) async {
  final Map<String, dynamic> requestBody = {
    'title': todo.title,
    'done': todo.done
  };

  await http.put(
    Uri.parse("$ENDPOINT/todos/${todo.id}?key=$APIKEY"),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(requestBody),
  );
}

void deleteTodo(Todo todo) async {
  await http.delete(Uri.parse("$ENDPOINT/todos/${todo.id}?key=$APIKEY"));
}
