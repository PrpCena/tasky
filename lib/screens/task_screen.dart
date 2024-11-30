import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/components/task_list.dart';
import 'package:tasky/models/task_data.dart';
import 'package:tasky/themes/colors.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  bool isButtonDisabled = false;

  void _handleTask() {
    if (isButtonDisabled) return;

    isButtonDisabled = true;
    Provider.of<TaskData>(context, listen: false).addTask('');

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        isButtonDisabled = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _handleTask(),
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
                Text(
                  '${Provider.of<TaskData>(context).getTaskListLength()} Tasks',
                  style: const TextStyle(
                    color: AppColors.taskCountText,
                    fontSize: 18,
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
