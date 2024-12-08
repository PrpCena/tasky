import '../task_repository.dart';

abstract class TaskRepository {
  String uid;

  TaskRepository({required this.uid});

  Stream<List<Task>?> get tasks;

  Future<void> addTask(String taskTitle);

  Future<void> removeTask(String taskId);

  Future<void> updateTaskTitle(Task task, String taskTitle);

  Future<void> toggleTaskStatus(Task task);
}
