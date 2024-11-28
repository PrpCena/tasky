import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:tasky/models/task_data.dart';

class TaskList extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<TaskData>(context).getTaskListLength(),
      itemBuilder: (context, index) {
        return TaskTile(
          task: Provider.of<TaskData>(context).taskList[index],
          toggleCheckBox: (value) =>
              Provider.of<TaskData>(context, listen: false)
                  .changeTaskStatus(index),
          deleteTask: () =>
              Provider.of<TaskData>(context, listen: false).removeTask(index),
          editTitle: Provider.of<TaskData>(context, listen: false)
              .taskList[index]
              .setTaskTitle,
        );
      },
    );
  }
}
