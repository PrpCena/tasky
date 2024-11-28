class Task {
  String _taskTitle = 'No Title';
  bool _isTaskDone = false;

  Task(String taskTitle) : _taskTitle = taskTitle ?? 'No Title';

  String get taskTitle => _taskTitle;
  bool get isTaskDone => _isTaskDone;

  void setTaskTitle(String? taskTitle) {
    _taskTitle = taskTitle ?? _taskTitle;
  }

  void changeTaskStatus() {
    _isTaskDone = !_isTaskDone;
  }
}
