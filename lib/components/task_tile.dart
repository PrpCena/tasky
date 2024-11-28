import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {this.title = 'No Title',
      this.isChecked = false,
      required this.onChanged,
      required this.onLongPress});

  final String title;
  final bool isChecked;
  final Function(bool?) onChanged;
  final GestureLongPressCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: onLongPress,
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
