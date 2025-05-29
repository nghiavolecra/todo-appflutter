import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../services/todo_service.dart';

class TaskListScreen extends StatefulWidget {
  final VoidCallback? onTaskChanged;
  TaskListScreen({this.onTaskChanged});

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final TodoService _todoService = TodoService();
  late Future<List<Todo>> _todosFuture;

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  void _loadTodos() {
    setState(() {
      _todosFuture = _todoService.fetchTodos();
    });
  }

  void _deleteTodo(String id) async {
    try {
      await _todoService.deleteTodo(id);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Task deleted')));
      _loadTodos();
      widget.onTaskChanged?.call();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Delete failed: $e')));
    }
  }

  void _showTaskDetail(Todo todo) {
    final _titleController = TextEditingController(text: todo.title);
    final _contentController = TextEditingController(text: todo.content);

    showDialog(
      context: context,
      builder: (context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth < 600
                ? constraints.maxWidth
                : 500;

            return Center(
              child: Container(
                width: width,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: EdgeInsets.all(16),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Task Detail',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        TextField(
                          controller: _titleController,
                          decoration: InputDecoration(labelText: 'Title'),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: _contentController,
                          decoration: InputDecoration(labelText: 'Content'),
                        ),
                        SizedBox(height: 16),
                        Wrap(
                          spacing: 10,
                          children: [
                            ElevatedButton.icon(
                              icon: Icon(Icons.check),
                              label: Text('Mark Done'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () async {
                                final updated = todo.copyWith(status: 'done');
                                await _todoService.updateTodo(
                                  todo.id!,
                                  updated,
                                );
                                Navigator.of(context).pop();
                                _loadTodos();
                              },
                            ),
                            ElevatedButton.icon(
                              icon: Icon(Icons.save),
                              label: Text('Save'),
                              onPressed: () async {
                                final updated = todo.copyWith(
                                  title: _titleController.text,
                                  content: _contentController.text,
                                );
                                await _todoService.updateTodo(
                                  todo.id!,
                                  updated,
                                );
                                Navigator.of(context).pop();
                                _loadTodos();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Close'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FutureBuilder<List<Todo>>(
        future: _todosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No tasks found'));
          } else {
            final todos = snapshot.data!;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                final tagColor = todo.status == 'in_progress'
                    ? Colors.blue
                    : Colors.green;

                return GestureDetector(
                  onTap: () => _showTaskDetail(todo),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFF8F6FD),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              todo.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              todo.status == 'done'
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              color: tagColor,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: tagColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            todo.content ?? 'No description',
                            style: TextStyle(
                              fontSize: 12,
                              color: tagColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

extension on Todo {
  Todo copyWith({
    String? title,
    String? content,
    String? status,
    DateTime? datetime,
  }) {
    return Todo(
      id: id,
      title: title ?? this.title,
      content: content ?? this.content,
      status: status ?? this.status,
      datetime: datetime ?? this.datetime,
    );
  }
}
