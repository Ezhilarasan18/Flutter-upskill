import 'dart:async';

class Task {
  final String id;
  final String title;
  final String category;
  final String iconname;
  Task(this.id, this.title,this.category,this.iconname);
}

class TaskBloc {
  final _tasksController = StreamController<List<Task>>();
  Stream<List<Task>> get tasksStream => _tasksController.stream;

 List<Task> _tasks = [];

  void addTask(Task task) {
    _tasks.add(task);
    _tasksController.sink.add(_tasks);
  }

  void updateTask(Task updatedTask) {
    final index = _tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      _tasks[index] = updatedTask;
      _tasksController.sink.add(_tasks);
    }
  }

  void deleteTask(String taskId) {
    _tasks.removeWhere((task) => task.id == taskId);
    _tasksController.sink.add(_tasks);
  }

  void dispose() {
    _tasksController.close();
  }
}

final taskBloc = TaskBloc();
