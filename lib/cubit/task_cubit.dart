import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/task.dart';

class TaskCubit extends Cubit<List<Task>> {
  TaskCubit() : super([Task('Buy Milk')]);

  void addTask(String taskTitle) {
    emit([...state, Task(taskTitle)]);
  }

  void removeTaskByObject(Task task) {
    emit(state.where((t) => t != task).toList());
  }

  void updateTask(Task oldTask, Task newTask) {
    emit(state.map((task) => task == oldTask ? newTask : task).toList());
  }
}
