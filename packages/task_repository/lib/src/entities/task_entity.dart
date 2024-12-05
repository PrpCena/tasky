class TaskEntity {
  String taskId;
  String taskTitle;
  bool? taskStatus;

  TaskEntity(
      {required this.taskId,
      required this.taskTitle,
      required this.taskStatus});

  static TaskEntity empty =
      TaskEntity(taskId: '', taskTitle: '', taskStatus: null);

  Map<String, dynamic> toDocument() => {
        'taskId': taskId,
        'taskTitle': taskTitle,
        'taskStatus': taskStatus as bool
      };

  static TaskEntity fromDocument(Map<String, dynamic> doc) => TaskEntity(
      taskId: doc['taskId'],
      taskTitle: doc['taskTitle'],
      taskStatus: doc['taskStatus']);
}
