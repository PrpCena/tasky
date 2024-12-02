import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/themes/colors.dart';
import 'package:tasky/models/task.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../cubit/task_cubit.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    String newTitle = task.taskTitle;
    bool editMode = newTitle.isEmpty ? true : false;

    return GestureDetector(
      onDoubleTap: () => editMode = !editMode,
      onTap: () => BlocProvider.of<TaskCubit>(context).updateTask(
        task,
        task.copyWith(isTaskDone: !task.isTaskDone),
      ),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: (context) =>
                BlocProvider.of<TaskCubit>(context).removeTaskByObject(task),
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
                  initialValue: task.taskTitle,
                  autofocus: true,
                  onChanged: (value) => newTitle = value,
                  onTapOutside: (value) {
                    // String title = newTitle.trim();
                    if (newTitle.isNotEmpty) {
                      BlocProvider.of<TaskCubit>(context)
                          .updateTask(task, task.copyWith(taskTitle: newTitle));
                    } else if (task.taskTitle.trim().isEmpty) {
                      BlocProvider.of<TaskCubit>(context)
                          .removeTaskByObject(task);
                    }
                    editMode = !editMode;
                  },
                )
              : Text(
                  task.taskTitle,
                  style: TextStyle(
                    color: task.isTaskDone
                        ? AppColors.completedTaskText
                        : AppColors.taskText,
                    decoration:
                        task.isTaskDone ? TextDecoration.lineThrough : null,
                  ),
                ),
        ),
      ),
    );
  }
}
