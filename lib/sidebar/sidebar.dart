import 'package:flutter/material.dart';
import 'package:okuyan_muhendis/screens/adviceOfTeacher/adviceOfTeacher.dart';
import 'package:okuyan_muhendis/screens/adviceOfTheMonth/adviceOfTheMonth.dart';
import 'package:okuyan_muhendis/screens/authenticate/sign_in.dart';
import 'package:okuyan_muhendis/screens/bookAnalysis/bookAnalysis.dart';
import 'package:okuyan_muhendis/screens/myList/myList.dart';
import 'package:okuyan_muhendis/services/auth.dart';

class NavDrawer extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/fsm.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Kitap Analizi'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BookAnalysis()));
            },
          ),
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text('Hocalardan Tavsiyeler'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdviceOfTeacher()));
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Ayın Tavsiyesi'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdviceOfTheMonth()));
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Listem'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyList()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Çıkış'),
            onTap: () async {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Signin()));
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
