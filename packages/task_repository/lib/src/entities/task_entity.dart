import 'package:cloud_firestore/cloud_firestore.dart';

class TaskEntity {
  String taskId;
  String taskTitle;
  bool? taskStatus;
  Timestamp? time;

  TaskEntity({
    required this.taskId,
    required this.taskTitle,
    required this.taskStatus,
    required this.time,
  });

  static TaskEntity empty = TaskEntity(
      taskId: '', taskTitle: '', taskStatus: null, time: Timestamp.now());

  Map<String, dynamic> toDocument() => {
        'taskId': taskId,
        'taskTitle': taskTitle,
        'taskStatus': taskStatus as bool,
        'time': time as Timestamp,
      };

  static TaskEntity fromDocument(Map<String, dynamic> doc) => TaskEntity(
        taskId: doc['taskId'],
        taskTitle: doc['taskTitle'],
        taskStatus: doc['taskStatus'],
        time: doc['time'],
      );

  @override
  String toString() =>
      'TaskEntity { taskId: $taskId, taskTitle: $taskTitle, taskStatus: $taskStatus, time: $time }';
}
