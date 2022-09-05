import 'dart:convert';

class Doctor {
  String uid;
  String email;
  String type;
  String name;

  Doctor({
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

  factory Doctor.fromJson(Map<String, dynamic> map) {
    return Doctor(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      type: map['type'] ?? '',
      name: map['name'] ?? '',
    );
  }
  
  String toJsonString() => json.encode(toJson());

  factory Doctor.fromJsonString(String source) => Doctor.fromJson(json.decode(source));
}
