import 'package:flutter/material.dart';
import '../utils/constants.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final int count;
  const SectionTitle({required this.title, required this.count, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Text(title, style: kSectionTitleStyle),
      SizedBox(width: 8),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          "$count",
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
