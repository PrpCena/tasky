import '../user_repository.dart';

abstract class TaskRepository {
  String uid;

  TaskRepository({required this.uid});

  Stream<List<Task>?> get tasks;

  Future<void> addTask(Task task);

  Future<void> removeTask(Task task);

  Future<void> editTaskTitle(Task task, String taskTitle);

  Future<void> toggleTaskStatus(Task task);
}
