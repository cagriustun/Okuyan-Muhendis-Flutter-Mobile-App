import 'package:flutter/material.dart';
import 'package:okuyan_muhendis/screens/adviceOfTeacher/adviceOfTeacher.dart';
import 'package:okuyan_muhendis/screens/Search/Search.dart';
import 'package:okuyan_muhendis/screens/myList/myList.dart';
import 'package:okuyan_muhendis/services/auth.dart';
import 'package:okuyan_muhendis/sidebar/sidebar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:okuyan_muhendis/models/books.dart';
import 'package:okuyan_muhendis/screens/bookAnalysis/bookAnalysis.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    Widget teacherofAdvice = CarouselSlider(
      height: 200.0,
      enlargeCenterPage: true,
      autoPlay: true,
      aspectRatio: 1 / 2,
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: Duration(milliseconds: 2000),
      viewportFraction: 0.99,
      items: [
        'https://raw.githubusercontent.com/cagriustun/okuyan_muhendis/master/assets/advice/ad1.png',
        'https://raw.githubusercontent.com/cagriustun/okuyan_muhendis/master/assets/advice/ad2.png',
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 0.0, left: 2.0, right: 2.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: GestureDetector(
                  child: Image.network(i, fit: BoxFit.fill),
                  onTap: () {
                    Navigator.push<Widget>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookAnalysis(i),
                      ),
                    );
                  }),
            );
          },
        );
      }).toList(),
    );
    Widget spaceBox = Container(
      alignment: Alignment.center,
      height: 130,
    );
    Widget bookSlider = CarouselSlider(
      height: 200.0,
      enlargeCenterPage: true,
      autoPlay: true,
      aspectRatio: 16 / 9,
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      viewportFraction: 0.3,
      items: [
        'https://upload.wikimedia.org/wikipedia/en/4/4b/Crimeandpunishmentcover.png',
        'https://upload.wikimedia.org/wikipedia/commons/2/27/The_House_of_the_Dead_-_Fyodor_Dostoyevsky.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/b/b3/Notes_from_underground_cover.jpg',
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 60.0, left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: GestureDetector(
                    child: Image.network(i, fit: BoxFit.fill),
                    onTap: () {
                      Navigator.push<Widget>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookAnalysis(i),
                        ),
                      );
                    }));
          },
        );
      }).toList(),
    );
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
      body: ListView(
        children: <Widget>[teacherofAdvice, spaceBox, bookSlider],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Anasayfa'),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Arama'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('Listem'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              title: Text('Tavsiyeler'),
              backgroundColor: Colors.blue)
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
