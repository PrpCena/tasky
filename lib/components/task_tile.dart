import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/models/task.dart';
import 'package:tasky/models/task_data.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({super.key, required this.task});

  final Task task;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool editMode = false;
  late String newTitle;

  @override
  void initState() {
    super.initState();
    newTitle = widget.task.taskTitle ?? '';
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
                  widget.task.setTaskTitle(title);
                  editMode = !editMode;
                });
              }
            },
          )
        : Text(
            widget.task.taskTitle ?? '',
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
      onLongPress: () => Provider.of<TaskData>(context, listen: false)
          .removeTaskByObject(widget.task),
      onDoubleTap: () => setState(() {
        editMode = !editMode;
      }),
      child: ListTile(
          title: titleMode(),
          trailing: editMode
              ? null
              : Checkbox(
                  value: widget.task.isTaskDone,
                  onChanged: (value) => setState(() {
                    widget.task.changeTaskStatus();
                  }),
                  activeColor: const Color(0xFF5DA4A9),
                )),
    );
  }
}
