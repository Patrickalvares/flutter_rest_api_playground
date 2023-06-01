import 'package:flutter_rest_api_playground/model/user_name.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;

  User(
      {required this.name,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nat,
      required this.gender});

  String get fullName {
    return '${name.title}. ${name.first} ${name.last}';
  }
}
