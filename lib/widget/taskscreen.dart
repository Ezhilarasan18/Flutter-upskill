import 'package:flutter/material.dart';
import 'package:evaluation_one/bloc/task_bloc.dart';
import 'dart:math';
class TaskScreen extends StatefulWidget {
  const TaskScreen ({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
   String _inputText = '';
  final List<String> _dropdownItems = ['Clothes', 'Electronics', 'Vegetables'];
  String _selectedCategory = 'Clothes';
   String generateUniqueId() {
  int randomNumber = Random().nextInt(999999999);
  // String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  print(randomNumber);
  return '$randomNumber';
}

void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context,setState){
            return Container(
          padding: const EdgeInsets.only(top:16.0),
          child:
           Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                scrollPadding: const EdgeInsets.only(top:20),
              onChanged: (text) {
                setState(() {
                  _inputText = text;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Enter category item',
                border: OutlineInputBorder(),
              ),
            ),
             const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:InkWell(
                  onTap: (){
                    taskBloc.addTask(Task(generateUniqueId(), _inputText,_selectedCategory,'beach_access'));
                  },
                  child: const Text('Add item'),
                ),
              ),
              DropdownButton<String>(
            value: _selectedCategory,
            onChanged: (newValue) {
              // Update the selected item
              setState(() {
              print('ddf$newValue');
                
              _selectedCategory = newValue!;
              });
            },
            items: _dropdownItems.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList())
            ],
          ),
        );
        
          }
          );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Add your action here
              // For example, navigate to settings page
              openBottomSheet(context);
            },
          ),
        ],
      ),
      body: 
        StreamBuilder<List<Task>>(
            stream: taskBloc.tasksStream,
            initialData: [],
            builder: (context, snapshot) {
              final tasks = snapshot.data;
              return ListView.builder(
                itemCount: tasks?.length,
                itemBuilder: (context, index) {
                  final task = tasks![index];
                  return ListTile(
                    title: Text(task.category,style: const TextStyle(fontSize:25,color: Colors.blue),),
                    subtitle: Text(task.title,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey),),
                    leading: 
                    Column(
                      children: [
                        if(task.category=='Clothes') const IconButton(icon:  Icon(Icons.favorite),onPressed: null,)
                        else if(task.category=='Electronics') const IconButton(icon:  Icon(Icons.movie_creation),onPressed: null,)
                        else if(task.category=='Vegetables') const IconButton(icon:  Icon(Icons.home_filled),onPressed: null,)

                      ],
                    ),
                    // task.category=='Clothes'? const IconButton(icon:  Icon(Icons.favorite),onPressed: null,):const IconButton(icon:  Icon(Icons.beach_access),onPressed: null,),
                    trailing: IconButton(
                      icon:const Icon(Icons.delete),
                      onPressed: () {
                        taskBloc.deleteTask(task.id);
                      },
                    ),
                  );
                },
              );
            },
          ) ,
    );
  }
}


