import 'package:flutter/material.dart';
import 'package:template/task_list_item.dart';

enum TaskFilter {
  All,
  Done,
  Undone,
}

class TaskFilterModel extends ChangeNotifier {
  TaskFilter _selectedFilter = TaskFilter.All;

  TaskFilter get selectedFilter => _selectedFilter;

  void setFilter(TaskFilter filter) {
    _selectedFilter = filter;
    notifyListeners();
  }

  List<Task> applyFilter(List<Task> tasks) {
    switch (_selectedFilter) {
      case TaskFilter.Done:
        return tasks.where((task) => task.isDone).toList();
      case TaskFilter.Undone:
        return tasks.where((task) => !task.isDone).toList();
      case TaskFilter.All:
      default:
        return tasks;
    }
  }
}
