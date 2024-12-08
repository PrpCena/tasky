part of 'task_bloc.dart';

sealed class TaskState extends Equatable {}

class TaskInitial extends TaskState {
  @override
  List<Object?> get props => [];
}

class TaskListLoaded extends TaskState {
  final List<Task> taskList;

  TaskListLoaded(this.taskList);

  @override
  List<Object?> get props => [taskList];
}

class TaskListUpdating extends TaskState {
  @override
  List<Object?> get props => [];
}

class TaskFailure extends TaskState {
  @override
  List<Object?> get props => [];
}
