import 'package:flutter/material.dart';
import '../services/todo_service.dart';
import '../models/todo.dart';
import '../utils/constants.dart';

class AddTaskDialog extends StatefulWidget {
  final VoidCallback onAdded;
  const AddTaskDialog({required this.onAdded, Key? key}) : super(key: key);

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final _titleCtrl = TextEditingController();
  final _contentCtrl = TextEditingController();
  final _service = TodoService();

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text("Add New Task"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _titleCtrl,
          decoration: InputDecoration(labelText: 'Title'),
        ),
        TextField(
          controller: _contentCtrl,
          decoration: InputDecoration(labelText: 'Content'),
        ),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text("Cancel"),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
        onPressed: () async {
          final title = _titleCtrl.text.trim();
          if (title.isEmpty) return;
          try {
            final todo = Todo(
              title: title,
              content: _contentCtrl.text,
              datetime: DateTime.now(),
              status: 'in_progress',
            );
            await _service.createTodo(todo);
            widget.onAdded();
            Navigator.pop(context);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Task added!')));
          } catch (e) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: $e')));
          }
        },
        child: Text("Add"),
      ),
    ],
  );
}
