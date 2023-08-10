import 'package:flutter/foundation.dart';
class Task {
  final String id;
  final String title;
  final bool isCompleted;
  final String category;

  Task({required this.id, required this.title, this.isCompleted = false,required this.category});
}

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(id: '1', title: 'Buy groceries',category: 'Electronics'),
    Task(id: '2', title: 'Go to the gym',category:'Electronics' ),
  ];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  // void updateTaskCompletion(Task task, bool isCompleted) {
  //   final index = _tasks.indexOf(task);
  //   _tasks[index] = task.copyWith(isCompleted: isCompleted);
  //   notifyListeners();
  // }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
