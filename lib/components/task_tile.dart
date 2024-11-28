import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {this.title = 'No Title',
      this.isChecked = false,
      required this.onChanged});

  final String title;
  final bool isChecked;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          title,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: onChanged,
          activeColor: Colors.blueAccent,
        ));
  }
}
