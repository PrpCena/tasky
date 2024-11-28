import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:tasky/components/task.dart';

class TaskList extends StatefulWidget {
  TaskList({required this.taskList});
  final List<Task> taskList;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.taskList.length,
      itemBuilder: (context, index) {
        return TaskTile(
          title: widget.taskList[index].taskTitle,
          onChanged: (value) => setState(
            () => widget.taskList[index].changeTaskStatus(),
          ),
          isChecked: widget.taskList[index].isTaskDone,
        );
      },
    );
  }
}
