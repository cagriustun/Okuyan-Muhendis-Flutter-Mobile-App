import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:okuyan_muhendis/models/testBook.dart';

class JsonServices {
  static const String url =
      'https://raw.githubusercontent.com/cagriustun/okuyan_muhendis/master/lib/models/books.json';
  static Future<List<TestBook>> getBooks() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<TestBook> list = parseBooks(response.body);
        return list;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<TestBook> parseBooks(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<TestBook>((json) => TestBook.fromJson(json)).toList();
  }
}
