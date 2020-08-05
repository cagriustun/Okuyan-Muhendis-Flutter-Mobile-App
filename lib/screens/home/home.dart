import 'package:flutter/material.dart';
import 'package:okuyan_muhendis/services/auth.dart';
import 'package:okuyan_muhendis/sidebar/sidebar.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
      body: CarouselSlider(
        height: 500.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
        items: [
          Container(
            margin: EdgeInsets.only(top: 30.0, left: 5.0, right: 5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('assets/books/beyazgeceler.jpg'),
                  fit: BoxFit.fill,
                )),
          )
        ],
      ),
      /*
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bookcase.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      */
    );
  }
}
