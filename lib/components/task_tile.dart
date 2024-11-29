import 'package:flutter/material.dart';
import 'package:tasky/themes/colors.dart';
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
    if (newTitle.isEmpty) {
      editMode = true;
    }
  }

  Widget titleMode() {
    return editMode
        ? TextFormField(
            style: const TextStyle(color: AppColors.taskText),
            initialValue: widget.task.taskTitle,
            autofocus: true,
            onChanged: (value) => newTitle = value,
            onTapOutside: (value) {
              String title = newTitle.trim();
              setState(() {
                if (title.isNotEmpty) {
                  widget.task.setTaskTitle(title);
                } else {
                  Provider.of<TaskData>(context, listen: false)
                      .removeTaskByObject(widget.task);
                }
                editMode = !editMode;
              });
            },
          )
        : Text(
            widget.task.taskTitle ?? '',
            style: TextStyle(
              color: widget.task.isTaskDone
                  ? AppColors.completedTaskText
                  : AppColors.taskText,
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
      onTap: () => setState(() {
        widget.task.changeTaskStatus();
      }),
      child: ListTile(
        title: titleMode(),
      ),
    );
  }
}
