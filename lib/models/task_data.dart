import 'package:flutter/foundation.dart';
import 'task.dart';
import 'package:collection/collection.dart';

class TaskData extends ChangeNotifier {
  List<Task> _taskList = [
    Task(taskTitle: 'Buy Milk'),
    Task(taskTitle: 'Buy Fruits')
  ];

  UnmodifiableListView<Task> get taskList {
    return UnmodifiableListView(_taskList);
  }

  int getTaskListLength() {
    return _taskList.length;
  }

  void printTasks() {
    print(_taskList);
  }

  void addTask(String taskTitle) {
    _taskList.add(Task(taskTitle: taskTitle));
    notifyListeners();
  }

  void changeTaskStatus(int index) {
    _taskList[index].changeTaskStatus();
    notifyListeners();
  }
}
