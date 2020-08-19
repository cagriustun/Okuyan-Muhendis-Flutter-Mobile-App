import 'package:flutter/src/widgets/basic.dart';

class TestBook {
  int bookID;
  String bookName;
  String bookAuthor;
  String bookSummary;
  String bookPhoto;
  String bookRecomPhoto;
  TestBook(
      {this.bookID,
      this.bookName,
      this.bookAuthor,
      this.bookSummary,
      this.bookPhoto,
      this.bookRecomPhoto});

  factory TestBook.fromJson(Map<String, dynamic> json) {
    return TestBook(
      bookID: json["bookID"] as int,
      bookName: json["bookName"] as String,
      bookAuthor: json["bookAuthor"] as String,
      bookSummary: json["bookSummary"] as String,
      bookPhoto: json["bookPhoto"] as String,
      bookRecomPhoto: json["bookRecomPhoto"] as String,
    );
  }
}
