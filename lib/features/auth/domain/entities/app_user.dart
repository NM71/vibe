/*
Here we are doing:

JSON serialization/deserialization, making it simple to work with
backend systems, APIs, or local storage solutions (like Hive, Firebase, etc.).

*/


import 'dart:convert';

class AppUser {
  final String uid;
  final String email;
  final String name;

  // constructor
  AppUser({
    required this.uid,
    required this.email,
    required this.name,
  });

  // convert user data to -> json
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }

  // convert json to -> app user
  factory AppUser.fromJson(Map<String, dynamic> jsonUser) {
    return AppUser(
      uid: jsonUser['uid'],
      email: jsonUser['email'],
      name: jsonUser['name'],
    );
  }
}
