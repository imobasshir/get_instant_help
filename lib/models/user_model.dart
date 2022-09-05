import 'dart:convert';

class User {
  String uid;
  String email;
  String type;
  String name;

  User({
    required this.uid,
    required this.email,
    required this.type,
    required this.name
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'type': type,
      'name': name,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      type: map['type'] ?? '',
      name: map['name'] ?? '',
    );
  }
  
  String toJsonString() => json.encode(toJson());

  factory User.fromJsonString(String source) => User.fromJson(json.decode(source));
}
