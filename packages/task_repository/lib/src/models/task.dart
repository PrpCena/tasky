import 'package:cloud_firestore/cloud_firestore.dart';

import '../entities/entities.dart';

class Task {
  String taskId;
  String taskTitle;
  bool taskStatus;
  Timestamp time;

  Task({
    this.taskId = '',
    required this.taskTitle,
    this.taskStatus = false,
    required this.time,
  });

  static Task empty = Task(taskId: '', taskTitle: '', time: Timestamp.now());

  Task copyWith({
    String? taskId,
    String? taskTitle,
    bool? taskStatus,
    Timestamp? time,
  }) =>
      Task(
        taskId: taskId ?? this.taskId,
        taskTitle: taskTitle ?? this.taskTitle,
        taskStatus: taskStatus ?? this.taskStatus,
        time: time ?? this.time,
      );

  TaskEntity toEntity() => TaskEntity(
        taskId: taskId,
        taskTitle: taskTitle,
        taskStatus: taskStatus,
        time: time,
      );

  static Task fromEntity(TaskEntity entity) => Task(
        taskId: entity.taskId,
        taskTitle: entity.taskTitle,
        taskStatus: entity.taskStatus!,
        time: entity.time!,
      );

  @override
  String toString() => 'Task: $taskId, $taskTitle, $taskStatus, $time';
}
