import 'package:flutter/src/widgets/basic.dart';

class TestBook {
  int bookID;
  String bookName;
  String bookAuthor;
  String bookSummary;
  String bookPhoto;
  String bookRecomPhoto;
  String bookRecomTeacher;
  TestBook(
      {this.bookID,
      this.bookName,
      this.bookAuthor,
      this.bookSummary,
      this.bookPhoto,
      this.bookRecomPhoto,
      this.bookRecomTeacher});

  factory TestBook.fromJson(Map<String, dynamic> json) {
    return TestBook(
      bookID: json["bookID"] as int,
      bookName: json["bookName"] as String,
      bookAuthor: json["bookAuthor"] as String,
      bookSummary: json["bookSummary"] as String,
      bookPhoto: json["bookPhoto"] as String,
      bookRecomPhoto: json["bookRecomPhoto"] as String,
      bookRecomTeacher: json["bookRecomTeacher"] as String,
    );
  }
}
