class MyUserEntity {
  final String uid;
  final String name;
  final String email;

  MyUserEntity({required this.uid, required this.name, required this.email});

  Map<String, Object?> toDocument() => {
        'uId': uid,
        'email': email,
        'name': name,
      };

  static MyUserEntity fromDocument(Map<String, dynamic> doc) => MyUserEntity(
        uid: doc['uid'],
        email: doc['email'],
        name: doc['name'],
      );
}
