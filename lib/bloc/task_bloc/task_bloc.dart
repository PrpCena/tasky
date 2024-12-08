import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_repository/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _taskRepository;
  late final StreamSubscription<List<Task>?> _taskListSubscription;

  TaskBloc(this._taskRepository) : super(TaskInitial()) {
    _taskListSubscription = _taskRepository.tasks.listen((taskList) {
      add(TaskUpdatedList(taskList: taskList!));
    });

    on<TaskUpdatedList>((event, emit) async {
      // update the list
      emit(TaskListUpdating());
      try {
        emit(TaskListLoaded(event.taskList));
      } catch (e) {
        log(e.toString());
        emit(TaskFailure());
      }
    });

    on<TaskAdd>((event, emit) async {
      emit(TaskListUpdating());
      try {
        _taskRepository.addTask(event.taskTitle);
      } catch (e) {
        log(e.toString());
        emit(TaskFailure());
      }
    });

    on<TaskRemove>((event, emit) async {
      emit(TaskListUpdating());
      try {
        _taskRepository.removeTask(event.taskId);
      } catch (e) {
        log(e.toString());
        emit(TaskFailure());
      }
    });

    on<TaskUpdateTitle>((event, emit) async {
      emit(TaskListUpdating());
      try {
        _taskRepository.updateTaskTitle(event.task, event.newTaskTitle);
      } catch (e) {
        log(e.toString());
        emit(TaskFailure());
      }
    });

    on<TaskToggleStatus>((event, emit) async {
      emit(TaskListUpdating());
      try {
        _taskRepository.toggleTaskStatus(event.task);
      } catch (e) {
        log(e.toString());
        emit(TaskFailure());
      }
    });
  }
}
