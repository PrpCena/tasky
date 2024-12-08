import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:tasky/bloc/task_bloc/task_bloc.dart';
import 'package:tasky/components/task_list.dart';
import 'package:tasky/themes/colors.dart';

class TaskScreen extends StatelessWidget {
  static const String id = 'task_screen';
  final String userName;

  const TaskScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled = true;

    return BlocListener<TaskBloc, TaskState>(
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
                  content: Text('Something went wrong. Please try again.')),
            );
            break;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.accent,
          leading: IconButton(
            onPressed: () => context
                .read<AuthenticationBloc>()
                .add(AuthenticationUserLogout()),
            icon: Icon(Icons.logout),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (isButtonEnabled) {
              isButtonEnabled = false; // Disable the button
              context.read<TaskBloc>().add(TaskAdd(taskTitle: ''));
              await Future.delayed(
                  const Duration(seconds: 2), () => isButtonEnabled = true);
            }
          },
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
              padding: const EdgeInsets.only(
                  left: 60, right: 30, top: 20, bottom: 30),
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
                  BlocBuilder<TaskBloc, TaskState>(
                    builder: (context, state) {
                      if (state is TaskListLoaded) {
                        return Text(
                          '${state.taskList.length} Tasks Remaining \n Let\'s get it $userName',
                          style: const TextStyle(
                            color: AppColors.taskCountText,
                            fontSize: 18,
                          ),
                        );
                      }
                      return const Text(
                        'Loading Tasks...',
                        style: TextStyle(
                          color: AppColors.taskCountText,
                          fontSize: 18,
                        ),
                      );
                    },
                  ),
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
                child: const TaskList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
