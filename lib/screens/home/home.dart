import 'package:flutter/material.dart';
import 'package:okuyan_muhendis/screens/Search/Search.dart';
import 'package:okuyan_muhendis/services/auth.dart';
import 'package:okuyan_muhendis/sidebar/sidebar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:okuyan_muhendis/screens/bookAnalysis/bookAnalysis.dart';
import 'package:okuyan_muhendis/models/testBook.dart';
import 'package:okuyan_muhendis/services/jsonServices.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<TestBook> books = List();
  List<TestBook> filteredBooks = List();

  @override
  void initState() {
    super.initState();
    JsonServices.getBooks().then((booksFromServer) {
      setState(() {
        books = booksFromServer;
        filteredBooks = books;
      });
    });
  }

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    Widget teacherofAdvice = CarouselSlider(
      height: 200.0,
      enlargeCenterPage: true,
      autoPlay: true,
      aspectRatio: 1 / 2,
      autoPlayCurve: Curves.decelerate,
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: Duration(milliseconds: 4000),
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
      height: 40,
    );
    Widget row1 = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15.0, top: 5.0, bottom: 10.0),
          child: Text('Hocalarımızdan Tavsiyeler',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 110.0,
            height: 30.0,
            child: Card(
              color: Colors.blue,
              child: Row(
                children: <Widget>[
                  Text(
                    'Tümünü Gör',
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                    textAlign: TextAlign.right,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
    Widget goodSentences = Align(
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
        child: Text(
          '"En büyük mutluluk, mutsuzluğun kaynağını bilmektir."',
          style: TextStyle(
              color: Colors.black, fontSize: 17.0, fontStyle: FontStyle.italic),
        ),
      ),
    );
    Widget row2 = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 292.0,
              height: 30.0,
              child: Text('Ayın Seçkin Kitapları',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 110.0,
            height: 30.0,
            child: Card(
              color: Colors.blue,
              child: Row(
                children: <Widget>[
                  Text(
                    'Tümünü Gör',
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                    textAlign: TextAlign.right,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    Widget bookSlider = CarouselSlider(
      height: 150.0,
      enlargeCenterPage: true,
      autoPlay: true,
      aspectRatio: 16 / 9,
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: Duration(milliseconds: 600),
      viewportFraction: 0.3,
      items: [
        'https://raw.githubusercontent.com/cagriustun/okuyan_muhendis/master/assets/bookCovers/1.jpg',
        'https://raw.githubusercontent.com/cagriustun/okuyan_muhendis/master/assets/bookCovers/2.jpg',
        'https://raw.githubusercontent.com/cagriustun/okuyan_muhendis/master/assets/bookCovers/3.jpg',
        'https://raw.githubusercontent.com/cagriustun/okuyan_muhendis/master/assets/bookCovers/4.jpg',
        'https://raw.githubusercontent.com/cagriustun/okuyan_muhendis/master/assets/bookCovers/5.jpg'
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 0.0, left: 10.0, right: 10.0),
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
      backgroundColor: Colors.white,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [row1, teacherofAdvice, goodSentences, row2, bookSlider],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Anasayfa'),
              backgroundColor: Colors.white),
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
              backgroundColor: Colors.black)
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
