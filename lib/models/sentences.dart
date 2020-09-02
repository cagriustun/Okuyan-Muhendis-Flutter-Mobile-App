import 'package:flutter/src/widgets/basic.dart';

class Sentences {
  int sentenceID;
  String sentence;
  Sentences({
    this.sentenceID,
    this.sentence,
  });

  factory Sentences.fromJson(Map<String, dynamic> json) {
    return Sentences(
      sentenceID: json["sentenceID"] as int,
      sentence: json["sentence"] as String,
    );
  }
}
