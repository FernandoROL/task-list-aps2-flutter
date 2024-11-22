import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(String, String, int) onAddTask;

  const AddTaskScreen({required this.onAddTask, super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _difficultyController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  String? _imagePreview;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Task Name'),
            ),
            TextField(
              controller: _difficultyController,
              decoration: const InputDecoration(labelText: 'Difficulty (1-5)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _imageController,
              decoration: const InputDecoration(labelText: 'Image URL'),
              onChanged: (value) {
                setState(() {
                  _imagePreview = value;
                });
              },
            ),
            if (_imagePreview != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Image.network(
                  _imagePreview!,
                  height: 150,
                  errorBuilder: (_, __, ___) =>
                      const Text("Invalid Image URL"),
                ),
              ),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final difficulty =
                    int.tryParse(_difficultyController.text) ?? 0;
                final image = _imageController.text;

                if (name.isNotEmpty && difficulty > 0 && difficulty <= 5) {
                  widget.onAddTask(name, image, difficulty);
                  Navigator.pop(context); // Go back to the main screen
                }
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}