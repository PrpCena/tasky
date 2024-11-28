import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/components/task_list.dart';
import 'package:tasky/models/task_data.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<TaskData>(context, listen: false).addTask(''),
        backgroundColor: const Color(0xFF5DA4A9),
        foregroundColor: const Color(0xFFFFFFFF),
        child: const Icon(
          CupertinoIcons.plus,
          color: Color(0xFFFFFFFF),
          size: 30,
        ),
      ),
      backgroundColor: const Color(0xFFEAE6F9),
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
                  backgroundColor: Color(0xFF5DA4A9),
                  child: Icon(
                    Icons.list,
                    color: Color(0xFFEAE6F9),
                    size: 40,
                  ),
                ),
                const Text(
                  'Tasky',
                  style: TextStyle(
                    color: Color(0xFF2D2A32),
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).getTaskListLength()} Tasks',
                  style: const TextStyle(
                    color: Color(0xFF747474),
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
                color: Color(0xFFFFF6EB),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: TaskList(),
            ),
          )
        ],
      ),
    );
  }
}
