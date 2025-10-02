import 'package:flutter/material.dart';
import '../models/task.dart';
import '../database/db_helper.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> loadTasks() async {
    _tasks = await DBHelper.getTasks();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await DBHelper.insertTask(task);
    await loadTasks();
  }

  Future<void> toggleTask(Task task) async {
    final updated = Task(id: task.id, title: task.title, isDone: !task.isDone);
    await DBHelper.updateTask(updated);
    await loadTasks();
  }

  Future<void> updateTask(Task task) async {
    await DBHelper.updateTask(task);
    await loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await DBHelper.deleteTask(id);
    await loadTasks();
  }
}
