import 'package:flutter/material.dart';
import 'widgets/task.dart';
import 'screens/add_task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TaskScreen(),
    );
  }
}

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final List<Task> tasks = [
    Task('Destruir o planeta terra', 'https://cdn-icons-png.flaticon.com/512/3027/3027582.png', 5),
    Task('Se hidratar', 'https://cdn-icons-png.flaticon.com/512/3105/3105807.png', 1),
  ];

  void _addTask(String name, String imageUrl, int difficulty) {
    setState(() {
      tasks.add(Task(name, imageUrl, difficulty));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => tasks[index],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(onAddTask: _addTask),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

