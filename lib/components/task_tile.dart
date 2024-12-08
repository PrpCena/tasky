import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_repository/task_repository.dart';
import 'package:tasky/bloc/task_bloc/task_bloc.dart';
import 'package:tasky/themes/colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({super.key, required this.task});
  final Task task;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  late String newTitle;
  late bool editMode;

  @override
  void initState() {
    super.initState();
    newTitle = widget.task.taskTitle.trim();
    editMode = newTitle.isEmpty ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => setState(() {
        editMode = !editMode;
      }),
      onTap: () =>
          context.read<TaskBloc>().add(TaskToggleStatus(task: widget.task)),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: (context) => context
                .read<TaskBloc>()
                .add(TaskRemove(taskId: widget.task.taskId)),
            backgroundColor: AppColors.background,
            foregroundColor: AppColors.circleAvatarBackground,
            icon: Icons.delete,
            label: 'Delete',
          )
        ]),
        child: ListTile(
          title: editMode
              ? TextFormField(
                  style: const TextStyle(color: AppColors.taskText),
                  initialValue: widget.task.taskTitle,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.zero,
                  ),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) =>
                      newTitle = value.replaceAll(RegExp(r'\s+'), ' ').trim(),
                  onTapOutside: (value) => setState(() {
                    if (newTitle.isNotEmpty &&
                        newTitle != widget.task.taskTitle) {
                      context.read<TaskBloc>().add(TaskUpdateTitle(
                          newTaskTitle: newTitle, task: widget.task));
                    } else if (widget.task.taskTitle.trim().isEmpty) {
                      context
                          .read<TaskBloc>()
                          .add(TaskRemove(taskId: widget.task.taskId));
                    }
                    editMode = !editMode;
                  }),
                )
              : Text(
                  widget.task.taskTitle,
                  style: TextStyle(
                    color: widget.task.taskStatus
                        ? AppColors.completedTaskText
                        : AppColors.taskText,
                    decoration: widget.task.taskStatus
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
        ),
      ),
    );
  }
}
