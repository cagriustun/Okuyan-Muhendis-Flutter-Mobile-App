import 'package:flutter/material.dart';
import 'package:okuyan_muhendis/screens/Search/Search.dart';
import 'package:okuyan_muhendis/screens/adviceOfTeacher/adviceOfTeacher.dart';
import 'package:okuyan_muhendis/screens/home/home.dart';
import 'package:okuyan_muhendis/screens/myList/myList.dart';

class BookAnalysis extends StatefulWidget {
  final String url;
  BookAnalysis(this.url);

  @override
  _BookAnalysis createState() => _BookAnalysis(url);
}

class _BookAnalysis extends State<BookAnalysis> {
  Color _iconColor = null;
  int _currentIndex = 1;
  final String url;
  _BookAnalysis(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitap Analizi'),
      ),
      body: Stack(
        children: <Widget>[
          Container(alignment: Alignment.topCenter, child: Image.network(url)),
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
                                  "Sıradan Bir Gün",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28.0),
                                ),
                                subtitle: Text("Yekta Kopan"),
                                trailing: new IconButton(
                                  icon: Icon(
                                    Icons.favorite,
                                    color: _iconColor,
                                    size: 30.0,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _iconColor = Colors.red;
                                    });
                                  },
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
                                    child: Text(
                                        "Sıradan bir günde başınıza neler gelebilir? Sıradan bir günde kahvaltı yapıp gazetenizi okuyabilir ve işinize gidebilirsiniz. Çalışırken biraz içiniz geçebilir mesela. Bir kahve içip toparlanabilirsiniz. Sıradan bir günde sevdiklerinizle görüşür, evinize market alışverişi yapabilirsiniz. Sıradan bir günde bir cinayete tanıklık edebilir ve hayatınızın sonsuz yolculuğuna çıkabilirsiniz. Sıradan bir gün size bazen kişisel gelişim kitaplarında yazanlardan fazlasını öğretir."),
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
            if (_currentIndex == 0) {
              Navigator.push<Widget>(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            } else if (_currentIndex == 1) {
              Navigator.push<Widget>(
                context,
                MaterialPageRoute(
                  builder: (context) => Search(),
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
    //body: Image.network(url, width: double.infinity));
  }
}
