import 'package:flutter/material.dart';
import 'package:tasky/themes/colors.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:tasky/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(
          Provider.of<TaskData>(context).getTaskListLength(),
          (index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.taskCardBackground,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.border),
              ),
              child: TaskTile(
                task: Provider.of<TaskData>(context).taskList[index],
              ),
            );
          },
        ),
      ],
    );
  }
}
