import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:okuyan_muhendis/models/sentences.dart';

class JsonServices {
  static const String url =
      'https://raw.githubusercontent.com/cagriustun/okuyan_muhendis/master/lib/models/sentences.json';
  static Future<List<Sentences>> getSentences() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Sentences> list = parseSentences(response.body);
        return list;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Sentences> parseSentences(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Sentences>((json) => Sentences.fromJson(json)).toList();
  }
}
