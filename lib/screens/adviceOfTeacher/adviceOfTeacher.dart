import 'package:flutter/material.dart';

class AdviceOfTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hocaların Kitap Tavsiyeleri'),
      ),
      body: Container(
        child: Center(
          child: Text('Hocanın Tavsiyeleri Sayfası'),
        ),
      ),
    );
  }
}
