import 'package:flutter/material.dart';
import 'package:okuyan_muhendis/models/testBook.dart';
import 'package:okuyan_muhendis/services/jsonServices.dart';

class BookAnalysisTest extends StatefulWidget {
  final int index;

  BookAnalysisTest(this.index);

  @override
  _BookAnalysisTestState createState() => _BookAnalysisTestState(index);
}

class _BookAnalysisTestState extends State<BookAnalysisTest> {
  final int index;
  int _currentIndex = 0;
  _BookAnalysisTestState(this.index);
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
        title: Text('Kitap Analizi'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
              alignment: Alignment.topCenter,
              child: Image.network(filteredBooks[index].bookPhoto)),
          SafeArea(
              child: Column(
            children: <Widget>[
              Spacer(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 10.0),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  filteredBooks[index].bookName,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28.0),
                                ),
                                subtitle: Text(
                                  filteredBooks[index].bookAuthor,
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  onPressed: () {},
                                ),
                              ),
                              ExpansionTile(
                                title: Text(
                                  "Detayları Göster",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topCenter,
                                    padding: const EdgeInsets.all(16.0),
                                    child:
                                        Text(filteredBooks[index].bookSummary),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ))
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
          });
        },
      ),
    );
  }
}
