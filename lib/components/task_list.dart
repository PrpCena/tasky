import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/bloc/task_bloc/task_bloc.dart';
import 'package:tasky/components/task_tile.dart';
import 'package:tasky/themes/colors.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        switch (state) {
          case TaskInitial():
            break;
          case TaskListLoaded():
            break;
          case TaskListUpdating():
            break;
          case TaskFailure():
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Something went wrong'),
              ),
            );
            break;
        }
      },
      builder: (context, state) {
        if (state is TaskListUpdating) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is TaskListLoaded) {
          return ListView.builder(
            itemCount: state.taskList.length,
            itemBuilder: (context, index) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.taskCardBackground,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.border),
                ),
                child: TaskTile(
                  task: state.taskList[index],
                ),
              );
            },
          );
        }

        return const Center(
          child: Text('No tasks found'),
        );
      },
    );
  }
}
