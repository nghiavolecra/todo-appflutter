import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title, tag;
  final Color tagColor;
  final VoidCallback? onTap;
  const TaskCard({
    required this.title,
    required this.tag,
    this.tagColor = Colors.blue,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: ListTile(
      onTap: onTap,
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Container(
        margin: EdgeInsets.only(top: 6),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: tagColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(tag, style: TextStyle(color: tagColor, fontSize: 12)),
      ),
      trailing: Icon(Icons.chevron_right),
    ),
  );
}
