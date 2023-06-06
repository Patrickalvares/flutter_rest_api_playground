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
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      final dob = UserDob(
        date: DateTime.parse(e['dob']['date']),
        age: e['dob']['age'],
      );
      final coordinates = LocationCoordinate(
        latitude: e['location']['coordinates']['latitude'],
        longitude: e['location']['coordinates']['longitude'],
      );
      final street = LocationStreet(
        number: e['location']['street']['number'],
        name: e['location']['street']['name'],
      );
      final timezone = LocationTimezone(
        offset: e['location']['timezone']['offset'],
        description: e['location']['timezone']['description'],
      );
      final location = UserLocation(
        city: e['location']['city'],
        state: e['location']['state'],
        country: e['location']['country'],
        postcode: e['location']['postcode'].toString(),
        street: street,
        coordinate: coordinates,
        timezone: timezone,
      );
      return User(
          location: location,
          name: name,
          cell: e['cell'],
          email: e['email'],
          gender: e['gender'],
          nat: e['nat'],
          phone: e['phone'],
          dob: dob);
    }).toList();

    return users;
  }
}
