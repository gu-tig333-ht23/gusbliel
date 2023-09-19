import 'package:http/http.dart' as http;
import 'dart:convert';

String ENDPOINT = "https://todoapp-api.apps.k8s.gu.se";
String APIKEY = "0ddf8a9f-38b5-4f88-935b-17424e88ed98";
class Todo {
  final String? id;
  final String title;
  bool done;

  Todo({
    this.id,
    required this.title,
    this.done = false, // Default value is false
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
    @override
  String toString() {
    return 'Todo: id=$id, title=$title, done=$done';
  }
}



Future<List<Todo>> getTodo() async {
  http.Response response = await http.get(Uri.parse("$ENDPOINT/todos?key=$APIKEY"));
  String body = response.body;

  List<dynamic> todosJson = jsonDecode(body);

  return todosJson.map((json) => Todo.fromJson(json)).toList();
}



void postTodo(Todo todo) async {
  Map<String, dynamic> jsonBody = todo.toJson();
  jsonBody.remove("id");

  http.Response response = await http.post(
    Uri.parse("$ENDPOINT/todos?key=$APIKEY"),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(jsonBody),
  );
}


