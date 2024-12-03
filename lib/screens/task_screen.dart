import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/components/task_list.dart';
import 'package:tasky/cubit/task_cubit.dart';
import 'package:tasky/themes/colors.dart';
import '../models/task.dart';

class TaskScreen extends StatelessWidget {
  static const String id = 'task_screen';
  @override
  Widget build(BuildContext context) {
    bool isButtonDisabled = false;

    void handleTask() {
      if (isButtonDisabled) return;

      isButtonDisabled = true;
      BlocProvider.of<TaskCubit>(context).addTask('');
      Future.delayed(const Duration(milliseconds: 300), () {
        isButtonDisabled = false;
      });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => handleTask(),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.iconForeground,
        child: const Icon(
          CupertinoIcons.plus,
          color: AppColors.iconForeground,
          size: 30,
        ),
      ),
      backgroundColor: AppColors.accent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 60, right: 30, top: 80, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.circleAvatarBackground,
                  child: Icon(
                    Icons.list,
                    color: AppColors.iconBackground,
                    size: 40,
                  ),
                ),
                const Text(
                  'Tasky',
                  style: TextStyle(
                    color: AppColors.headerText,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                BlocBuilder<TaskCubit, List<Task>>(
                  builder: (context, taskList) => Text(
                    '${taskList.length} Tasks',
                    style: const TextStyle(
                      color: AppColors.taskCountText,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 5),
              decoration: const BoxDecoration(
                color: AppColors.secondaryBackground,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}
