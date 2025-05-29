import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/todo.dart';

class TodoService {
  final String baseUrl = 'http://localhost:3000'; // đổi khi test thật

  Future<List<Todo>> fetchTodos() async {
    final res = await http.get(Uri.parse('$baseUrl/todos'));
    if (res.statusCode == 200) {
      final List list = jsonDecode(res.body);
      return list.map((e) => Todo.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<Todo> createTodo(Todo todo) async {
    final res = await http.post(
      Uri.parse('$baseUrl/todos'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(todo.toJson()),
    );
    if (res.statusCode == 201 || res.statusCode == 200) {
      return Todo.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to create todo');
    }
  }

  Future<void> deleteTodo(String id) async {
    final res = await http.delete(Uri.parse('$baseUrl/todos/$id'));
    if (res.statusCode != 200) {
      throw Exception('Failed to delete todo');
    }
  }

  Future<void> updateTodo(String id, Todo todo) async {
    final res = await http.put(
      Uri.parse('$baseUrl/todos/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(todo.toJson()),
    );
    if (res.statusCode != 200) {
      throw Exception('Failed to update todo');
    }
  }
}
