import '../entities/entities.dart';

class Task {
  String taskId;
  String taskTitle;
  bool taskStatus;

  Task({this.taskId = '', required this.taskTitle, this.taskStatus = false});

  static Task empty = Task(taskId: '', taskTitle: '');

  Task copyWith({String? taskId, String? taskTitle, bool? taskStatus}) => Task(
      taskId: taskId ?? this.taskId,
      taskTitle: taskTitle ?? this.taskTitle,
      taskStatus: taskStatus ?? this.taskStatus);

  TaskEntity toEntity() =>
      TaskEntity(taskId: taskId, taskTitle: taskTitle, taskStatus: taskStatus);

  static Task fromEntity(TaskEntity entity) => Task(
      taskId: entity.taskId,
      taskTitle: entity.taskTitle,
      taskStatus: entity.taskStatus!);

  @override
  String toString() => 'Task: $taskId, $taskTitle, $taskStatus';
}
