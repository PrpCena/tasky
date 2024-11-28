import 'package:flutter/foundation.dart';
import 'task.dart';
import 'package:collection/collection.dart';

class TaskData extends ChangeNotifier {
  List<Task> _taskList = [Task('Buy Milk'), Task('Buy Fruits')];

  UnmodifiableListView<Task> get taskList {
    return UnmodifiableListView(_taskList);
  }

  int getTaskListLength() {
    return _taskList.length;
  }

  void removeTask(int index) {
    _taskList.removeAt(index);
    notifyListeners();
  }

  void addTask(String taskTitle) {
    _taskList.add(Task(taskTitle));
    notifyListeners();
  }

  void changeTaskStatus(int index) {
    _taskList[index].changeTaskStatus();
    notifyListeners();
  }
}
