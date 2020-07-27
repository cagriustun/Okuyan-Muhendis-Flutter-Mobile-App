import 'package:flutter/material.dart';

class AdviceOfTheMonth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayın Tavsiyesi'),
      ),
      body: Container(
        child: Center(
          child: Text('Ayın Kitap Tavsiyesi Sayfası'),
        ),
      ),
    );
  }
}
