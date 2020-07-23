import 'package:flutter/material.dart';
import 'package:okuyan_muhendis/services/auth.dart';
import 'package:okuyan_muhendis/sidebar/sidebar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Okuyan Muhendis'),
        elevation: 1.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('ÇIKIŞ'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Center(
        child: Text('Side Menu Tutorial'),
      ),
    );
  }
}
/*
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Okuyan Muhenis'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('ÇIKIŞ'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
    );*/
