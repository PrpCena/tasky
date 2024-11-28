import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:tasky/models/task.dart';
import 'package:provider/provider.dart';
import 'package:tasky/models/task_data.dart';

class TaskList extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<TaskData>(context).getTaskListLength(),
      itemBuilder: (context, index) {
        return TaskTile(
          title: Provider.of<TaskData>(context).taskList[index].taskTitle,
          onChanged: (value) => Provider.of<TaskData>(context, listen: false)
              .changeTaskStatus(index),
          onLongPress: () =>
              Provider.of<TaskData>(context, listen: false).removeTask(index),
          isChecked: Provider.of<TaskData>(context).taskList[index].isTaskDone,
        );
      },
    );
  }
}
