import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasky/components/task_list.dart';
import 'package:tasky/screens/add_task_screen.dart';
import 'package:tasky/components/task.dart';

class TaskScreen extends StatefulWidget {
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> _taskList = [
    Task(taskTitle: 'Buy Milk'),
    Task(taskTitle: 'Buy Fruits')
  ];

  void addTask(String taskTitle) {
    setState(() {
      _taskList.add(Task(taskTitle: taskTitle));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => AddTask(
                    onPressed: addTask,
                  ));
        },
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        child: const Icon(
          CupertinoIcons.plus,
          color: Colors.white,
          size: 30,
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 60, right: 30, top: 80, bottom: 30),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlue,
                    size: 40,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Tasky',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '12 Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: TaskList(taskList: _taskList),
            ),
          )
        ],
      ),
    );
  }
}
