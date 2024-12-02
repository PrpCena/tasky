class Task {
  final String taskTitle;
  final bool isTaskDone;

  const Task(this.taskTitle, {this.isTaskDone = false});

  Task copyWith({String? taskTitle, bool? isTaskDone}) {
    return Task(
      taskTitle ?? this.taskTitle,
      isTaskDone: isTaskDone ?? this.isTaskDone,
    );
  }
}
