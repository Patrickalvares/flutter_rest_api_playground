import 'dart:convert';
import 'package:flutter_rest_api_playground/model/user.dart';
import 'package:flutter_rest_api_playground/model/user_dob.dart';
import 'package:flutter_rest_api_playground/model/user_location.dart';
import 'package:flutter_rest_api_playground/model/user_name.dart';
import "package:http/http.dart" as http;

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;

    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();

    return users;
  }
}
