import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:okuyan_muhendis/models/testUser.dart';

class JsonServices {
  static const String url = 'https://jsonplaceholder.typicode.com/users';
  static Future<List<TestUser>> getUsers() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<TestUser> list = parseUsers(response.body);
        return list;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<TestUser> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<TestUser>((json) => TestUser.fromJson(json)).toList();
  }
}
