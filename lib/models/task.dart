class Task {
  final String _taskTitle;
  bool _isTaskDone = false;

  Task({String taskTitle = 'No Title'}) : _taskTitle = taskTitle;

  String get taskTitle => _taskTitle;
  bool get isTaskDone => _isTaskDone;

  void changeTaskStatus() {
    _isTaskDone = !_isTaskDone;
  }
}
