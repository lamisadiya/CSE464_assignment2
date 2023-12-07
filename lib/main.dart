import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Todo {
  String task;
  bool isDone;

  Todo({required this.task, this.isDone = false});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todos = [
    Todo(task: 'Learn Flutter'),
    Todo(task: 'Teach State Management'),
    Todo(task: 'Import Provider package'),
    Todo(task: 'Add New Task'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/mine.jpg'),
                radius: 45.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  Text(
                    'Farhat Lamisa',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'lamisa.diya09@gmail.com',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'My Tasks',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Total Tasks: ${todos.length}',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: Colors.green[200],
          toolbarHeight: 240,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              todos[index].task,
              style: todos[index].isDone
                  ? TextStyle(decoration: TextDecoration.lineThrough)
                  : TextStyle(),
            ),
            leading: Checkbox(
              value: todos[index].isDone,
              onChanged: (bool? value) {
                setState(() {
                  todos[index].isDone = value!;
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green[200],
        child: const Text('+'),
      ),
    );
  }
}
