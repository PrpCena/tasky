import 'package:flutter/material.dart';
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
                color: const Color(0xFFFFFFFF), // White background for task
                borderRadius: BorderRadius.circular(10),
              ),
              child: TaskTile(
                task: Provider.of<TaskData>(context).taskList[index],
                deleteTask: () => Provider.of<TaskData>(context, listen: false)
                    .removeTask(index),
              ),
            );
          },
        ),
      ],
    );
  }
}
