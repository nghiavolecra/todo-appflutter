import 'package:flutter/material.dart';
import 'screens/home_page.dart'; // import HomePage từ màn hình bạn tách ra

void main() => runApp(TaskApp());

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // HomePage() chứ không phải main.dart
    );
  }
}
