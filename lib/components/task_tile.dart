import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/themes/colors.dart';
import 'package:tasky/models/task.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../cubit/task_cubit.dart';

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
    newTitle = widget.task.taskTitle;
    editMode = newTitle.isEmpty ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => setState(() {
        editMode = !editMode;
      }),
      onTap: () => BlocProvider.of<TaskCubit>(context).updateTask(
        widget.task,
        widget.task.copyWith(isTaskDone: !widget.task.isTaskDone),
      ),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: (context) => BlocProvider.of<TaskCubit>(context)
                .removeTaskByObject(widget.task),
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
                  onChanged: (value) => newTitle = value,
                  onTapOutside: (value) => setState(() {
                    if (newTitle.isNotEmpty) {
                      BlocProvider.of<TaskCubit>(context).updateTask(
                          widget.task,
                          widget.task.copyWith(taskTitle: newTitle));
                    } else if (widget.task.taskTitle.trim().isEmpty) {
                      BlocProvider.of<TaskCubit>(context)
                          .removeTaskByObject(widget.task);
                    }
                    editMode = !editMode;
                  }),
                )
              : Text(
                  widget.task.taskTitle,
                  style: TextStyle(
                    color: widget.task.isTaskDone
                        ? AppColors.completedTaskText
                        : AppColors.taskText,
                    decoration: widget.task.isTaskDone
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
        ),
      ),
    );
  }
}
