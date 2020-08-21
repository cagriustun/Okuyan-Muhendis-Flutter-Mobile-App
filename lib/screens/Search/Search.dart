import 'package:flutter/material.dart';
import 'dart:async';
import 'package:okuyan_muhendis/models/testBook.dart';
import 'package:okuyan_muhendis/screens/bookAnalysis/bookAnalysis.dart';
import 'package:okuyan_muhendis/screens/bookAnalysis/bookAnalysisTest.dart';
import 'package:okuyan_muhendis/services/jsonServices.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arama'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Kitap İsmi veya Yazar İsmi Giriniz',
            ),
            onChanged: (string) {
              setState(() {
                filteredBooks = books
                    .where((u) => (u.bookName
                            .toLowerCase()
                            .contains(string.toLowerCase()) ||
                        u.bookAuthor
                            .toLowerCase()
                            .contains(string.toLowerCase())))
                    .toList();
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredBooks[index].bookName),
                  subtitle: Text(filteredBooks[index].bookAuthor),
                  leading: Image(
                    alignment: Alignment.topRight,
                    image: NetworkImage(filteredBooks[index].bookPhoto),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookAnalysisTest(index)));
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Anasayfa'),
              backgroundColor: Colors.blue),
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
          setState(() async {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
