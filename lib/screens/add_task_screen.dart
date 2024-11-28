import 'package:flutter/material.dart';
import 'package:tasky/components/task_list.dart';

class AddTask extends StatelessWidget {
  AddTask({required this.onPressed});
  final Function(String) onPressed;

  String taskName = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Add Task',
            style: TextStyle(
              fontSize: 30,
              color: Colors.lightBlueAccent,
            ),
          ),
          TextField(
            onChanged: (value) => taskName = value,
            autofocus: true,
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                  Colors.lightBlueAccent), // Correct color
              shape: WidgetStateProperty.all(
                  const RoundedRectangleBorder()), // Correct shape
            ),
            onPressed: () {
              onPressed(taskName);
              Navigator.pop(context);
            },
            child: const Text(
              'Add',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
