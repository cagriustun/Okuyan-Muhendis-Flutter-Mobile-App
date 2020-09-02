import 'package:flutter/material.dart';
import 'package:okuyan_muhendis/screens/Search/Search.dart';
import 'package:okuyan_muhendis/screens/bookAnalysis/bookAnalysisTest.dart';
import 'package:okuyan_muhendis/screens/home/home.dart';
import 'package:okuyan_muhendis/screens/myList/myList.dart';
import 'package:okuyan_muhendis/services/jsonServices.dart';
import 'package:okuyan_muhendis/models/testBook.dart';

class AdviceOfTeacher extends StatefulWidget {
  @override
  _AdviceOfTeacherState createState() => _AdviceOfTeacherState();
}

class _AdviceOfTeacherState extends State<AdviceOfTeacher> {
  int _currentIndex = 3;
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
        title: Text('Tavsiyeler'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title:
                        Text(filteredBooks?.elementAt(index)?.bookName ?? ""),
                    subtitle:
                        Text(filteredBooks?.elementAt(index)?.bookAuthor ?? ""),
                    leading: Text(filteredBooks[index].bookRecomTeacher),
                    trailing: Image(
                      alignment: Alignment.topRight,
                      image: NetworkImage(
                          filteredBooks?.elementAt(index)?.bookPhoto ?? ""),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookAnalysisTest(index)));
                    });
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
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 0) {
              Navigator.push<Widget>(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            } else if (_currentIndex == 2) {
              Navigator.push<Widget>(
                context,
                MaterialPageRoute(
                  builder: (context) => MyList(),
                ),
              );
            } else if (_currentIndex == 3) {
              Navigator.push<Widget>(
                context,
                MaterialPageRoute(
                  builder: (context) => AdviceOfTeacher(),
                ),
              );
            }
          });
        },
      ),
    );
  }
}
