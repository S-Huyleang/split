class Users {
  static const String keyUid = 'uid';
  static const String keyEmail = 'email';
  static const String keyPassword = 'password';

  String? uid;
  String? email;
  String? password;

  Users({this.uid, this.email, this.password});

  Map<String, dynamic> toMap() => {keyEmail: email, keyPassword: password};

  factory Users.fromMap(Map<String, dynamic> map) =>
      Users(uid: map[keyUid], email: map[keyEmail], password: map[keyPassword]);
}
