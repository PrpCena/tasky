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

  void removeTaskByIndex(int index) {
    _taskList.removeAt(index);
    notifyListeners();
  }

  void removeTaskByObject(Task task) {
    _taskList.remove(task);
    notifyListeners();
  }

  void addTask(String taskTitle) {
    _taskList.add(Task(taskTitle));
    notifyListeners();
  }
}
