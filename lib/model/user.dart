import 'dart:ui';

import 'package:flutter_rest_api_playground/model/user_dob.dart';
import 'package:flutter_rest_api_playground/model/user_location.dart';
import 'package:flutter_rest_api_playground/model/user_name.dart';
import 'package:flutter_rest_api_playground/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;

  User({
    required this.dob,
    required this.name,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.location,
    required this.gender,
    required this.picture,
  });

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);
    final dob = UserDob.fromMap(e['dob']);
    final location = UserLocation.fromMap(e['location']);
    final picture = UserPicture.fromMap(e['picture']);
    return User(
      location: location,
      name: name,
      cell: e['cell'],
      email: e['email'],
      gender: e['gender'],
      nat: e['nat'],
      phone: e['phone'],
      dob: dob,
      picture: picture,
    );
  }

  String get fullName {
    return '${name.title}. ${name.first} ${name.last}';
  }
}
