import '../entities/entities.dart';

class MyUser {
  String uid;
  String name;
  String email;

  MyUser({required this.uid, required this.name, required this.email});

  static MyUser empty = MyUser(uid: '', name: '', email: '');

  MyUserEntity toEntity() => MyUserEntity(uid: uid, name: name, email: email);

  static MyUser fromEntity(MyUserEntity entity) =>
      MyUser(uid: entity.uid, name: entity.name, email: entity.email);

  @override
  String toString() => 'MyUser: $name, $email, $uid';
}
