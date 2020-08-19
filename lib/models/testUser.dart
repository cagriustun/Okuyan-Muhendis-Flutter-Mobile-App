class TestUser {
  int bookID;
  String bookName;
  String bookAuthor;
  String bookSummary;
  String bookPhoto;
  String bookRecomPhoto;
  TestUser(
      {this.bookID,
      this.bookName,
      this.bookAuthor,
      this.bookSummary,
      this.bookPhoto,
      this.bookRecomPhoto});

  factory TestUser.fromJson(Map<String, dynamic> json) {
    return TestUser(
      bookID: json["bookID"] as int,
      bookName: json["bookName"] as String,
      bookAuthor: json["bookAuthor"] as String,
      bookSummary: json["bookSummary"] as String,
      bookPhoto: json["bookPhoto"] as String,
      bookRecomPhoto: json["bookRecomPhoto"] as String,
    );
  }
}
