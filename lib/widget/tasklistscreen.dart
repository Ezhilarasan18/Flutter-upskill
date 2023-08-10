import 'package:flutter/material.dart';
import 'package:evaluation_one/provider/taskprovider.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    String selectedPriority = 'Clothes';
    return Scaffold(
      appBar: AppBar(title: const Text('Task Manager')),
      body: ListView.builder(
        itemCount: taskProvider.tasks.length,
        itemBuilder: (context, index) {
          final task = taskProvider.tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.category),
            leading: const Icon(Icons.add),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                taskProvider.deleteTask(task);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final title = await showDialog(
            context: context,
            builder: (BuildContext context) {
              String taskTitle = '';
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return AlertDialog(
                  title: const Text('Add Task'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        onChanged: (value) {
                          taskTitle = value;
                        },
                      ),
                      DropdownButton<String>(
                        value: selectedPriority,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedPriority = newValue!;
                          });
                        },
                        items: <String>['Clothes', 'Electronics', 'Vegetables']
                            .map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(taskTitle);
                      },
                      child: const Text('Add'),
                    ),
                  ],
                );
              });
            },
          );

          if (title != null && title.isNotEmpty) {
            taskProvider.addTask(Task(
                id: DateTime.now().toString(),
                title: title,
                category: selectedPriority));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
