class MyUserEntity {
  final String uid;
  final String name;
  final String email;

  MyUserEntity({required this.uid, required this.name, required this.email});

  Map<String, Object?> toDocument() => {
        'uid': uid,
        'email': email,
        'name': name,
      };

  static MyUserEntity fromDocument(Map<String, dynamic> doc) => MyUserEntity(
        uid: doc['uid'] is String ? doc['uid'] as String : '',
        email:
            doc['email'] is String ? doc['email'] as String : 'Unknown Email',
        name: doc['name'] is String ? doc['name'] as String : 'Unknown Name',
      );
}
