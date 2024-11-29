class Task {
  String? _taskTitle;
  bool _isTaskDone = false;

  Task(String taskTitle) : _taskTitle = taskTitle;

  String? get taskTitle => _taskTitle;
  bool get isTaskDone => _isTaskDone;

  void setTaskTitle(String? taskTitle) {
    _taskTitle = taskTitle;
  }

  void changeTaskStatus() {
    _isTaskDone = !_isTaskDone;
  }
}
