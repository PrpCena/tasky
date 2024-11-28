import 'package:flutter/material.dart';
import 'package:tasky/models/task.dart';

class TaskTile extends StatefulWidget {
  const TaskTile(
      {required this.task,
      required this.toggleCheckBox,
      required this.deleteTask,
      required this.editTitle});

  final Task task;
  final Function(bool?) toggleCheckBox;
  final GestureLongPressCallback deleteTask;
  final Function(String?) editTitle;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool editMode = false;
  String newTitle = 'No title';

  Widget titleMode() {
    return editMode
        ? TextFormField(
            initialValue: widget.task.taskTitle,
            autofocus: true,
            onChanged: (value) => newTitle = value,
            onTapOutside: (value) {
              widget.editTitle(newTitle);
              setState(() {
                editMode = !editMode;
              });
            },
          )
        : Text(
            widget.task.taskTitle,
            style: TextStyle(
              decoration:
                  widget.task.isTaskDone ? TextDecoration.lineThrough : null,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: widget.deleteTask,
      onDoubleTap: () => setState(() {
        editMode = !editMode;
      }),
      child: ListTile(
          title: titleMode(),
          trailing: editMode
              ? null
              : Checkbox(
                  value: widget.task.isTaskDone,
                  onChanged: widget.toggleCheckBox,
                  activeColor: Colors.blueAccent,
                )),
    );
  }
}
