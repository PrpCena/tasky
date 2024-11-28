import 'package:flutter/material.dart';
import 'package:tasky/models/task.dart';

class TaskTile extends StatefulWidget {
  const TaskTile(
      {super.key,
      required this.task,
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
  late String newTitle;

  @override
  void initState() {
    super.initState();
    newTitle = widget.task.taskTitle;
    if (newTitle == '') {
      editMode = true;
    }
  }

  Widget titleMode() {
    return editMode
        ? TextFormField(
            style: const TextStyle(color: Color(0xFF212121)),
            initialValue: widget.task.taskTitle,
            autofocus: true,
            onChanged: (value) => newTitle = value,
            onTapOutside: (value) {
              String title = newTitle.trim();

              if (title != '') {
                setState(() {
                  widget.editTitle(title);
                  editMode = !editMode;
                });
              }
            },
          )
        : Text(
            widget.task.taskTitle,
            style: TextStyle(
              color: const Color(0xFF212121),
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
                  activeColor: const Color(0xFF5DA4A9),
                )),
    );
  }
}
