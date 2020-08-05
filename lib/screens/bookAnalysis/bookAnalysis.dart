import 'package:flutter/material.dart';

class BookAnalysis extends StatefulWidget {
  final String url;
  BookAnalysis(this.url);

  @override
  _BookAnalysis createState() => _BookAnalysis(url);
}

class _BookAnalysis extends State<BookAnalysis> {
  final String url;
  _BookAnalysis(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kitap Analizi'),
        ),
        body: Image.network(url, width: double.infinity));
  }
}
