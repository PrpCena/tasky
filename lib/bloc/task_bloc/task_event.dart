part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {}

class TaskUpdatedList extends TaskEvent {
  final List<Task> taskList;

  TaskUpdatedList({required this.taskList});

  @override
  List<Object?> get props => [taskList];
}

class TaskAdd extends TaskEvent {
  final String taskTitle;

  TaskAdd({required this.taskTitle});

  @override
  List<Object?> get props => [taskTitle];
}

class TaskRemove extends TaskEvent {
  final String taskId;
  TaskRemove({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}

class TaskUpdateTitle extends TaskEvent {
  final String newTaskTitle;
  final Task task;

  TaskUpdateTitle({required this.newTaskTitle, required this.task});

  @override
  List<Object?> get props => [task, newTaskTitle];
}

class TaskToggleStatus extends TaskEvent {
  final Task task;

  TaskToggleStatus({required this.task});

  @override
  List<Object?> get props => [task];
}
