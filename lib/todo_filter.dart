import 'package:flutter/material.dart';
import 'get_todos_from_api.dart';

enum TodoFilter {
  All,
  Done,
  Undone,
}

//Sets a filter to the todo list.
class TodoFilterState extends ChangeNotifier {
  TodoFilter _selectedFilter = TodoFilter.All;

  TodoFilter get selectedFilter => _selectedFilter;

  void setFilter(TodoFilter filter) {
    _selectedFilter = filter;
    notifyListeners();
  }

  List<Todo> applyFilter(List<Todo> todos) {
    switch (_selectedFilter) {
      case TodoFilter.Done:
        return todos.where((todo) => todo.done).toList();
      case TodoFilter.Undone:
        return todos.where((todo) => !todo.done).toList();
      case TodoFilter.All:
      default:
        return todos;
    }
  }
}
