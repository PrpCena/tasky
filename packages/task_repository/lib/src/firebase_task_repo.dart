import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../task_repository.dart';

class FirebaseTaskRepo implements TaskRepository {
  @override
  String uid;
  final tasksCollection = FirebaseFirestore.instance.collection('users');

  FirebaseTaskRepo({required this.uid});

  @override
  Stream<List<Task>?> get tasks =>
      tasksCollection.doc(uid).collection('tasks').snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return Task.fromEntity(TaskEntity.fromDocument(doc.data()));
        }).toList();
      });

  @override
  Future<void> addTask(String taskTitle) async {
    try {
      final docRef = tasksCollection.doc(uid).collection('tasks').doc();
      final docId = docRef.id;
      await docRef.set(
          Task(taskId: docId, taskTitle: taskTitle).toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateTaskTitle(Task task, String taskTitle) async {
    try {
      final doc = tasksCollection.doc(uid).collection('tasks').doc(task.taskId);
      await doc.set(task
          .copyWith(taskTitle: taskTitle, taskId: task.taskId)
          .toEntity()
          .toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> removeTask(String taskId) async {
    try {
      final doc = tasksCollection.doc(uid).collection('tasks').doc(taskId);
      await doc.delete();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> toggleTaskStatus(Task task) async {
    try {
      final doc = tasksCollection.doc(uid).collection('tasks').doc(task.taskId);
      await doc.update({'taskStatus': !task.taskStatus});
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
