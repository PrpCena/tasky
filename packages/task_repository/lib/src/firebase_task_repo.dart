import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../user_repository.dart';

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
  Future<void> addTask(Task task) async {
    try {
      final docRef = tasksCollection.doc(uid).collection('tasks').doc();
      final docId = docRef.id;
      await docRef.set(task.copyWith(taskId: docId).toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> editTaskTitle(Task task, String taskTitle) async {
    try {
      final doc =
          await tasksCollection.doc(uid).collection('tasks').doc(task.taskId);
      await doc
          .set(task.copyWith(taskTitle: taskTitle).toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> removeTask(Task task) async {
    try {
      final doc =
          await tasksCollection.doc(uid).collection('tasks').doc(task.taskId);
      await doc.delete();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> toggleTaskStatus(Task task) async {
    try {
      final doc =
          await tasksCollection.doc(uid).collection('tasks').doc(task.taskId);
      await doc.update({'taskStatus': !task.taskStatus});
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
