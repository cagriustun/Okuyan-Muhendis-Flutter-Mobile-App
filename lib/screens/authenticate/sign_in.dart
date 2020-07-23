import 'package:flutter/material.dart';
import 'package:okuyan_muhendis/services/auth.dart';
import 'package:okuyan_muhendis/shared/constants.dart';
import 'package:okuyan_muhendis/shared/loading.dart';

class Signin extends StatefulWidget {
  final Function toggleView;
  Signin({this.toggleView});
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //email and pass
  String email = '';
  String password = '';
  //err
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('GİRİŞ YAP'),
              actions: <Widget>[
                FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('ÜYE OL'),
                    onPressed: () {
                      widget.toggleView();
                    })
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) =>
                          val.isEmpty ? 'Mail Adresinizi Giriniz' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Şifre'),
                      validator: (val) => val.length < 6
                          ? '6 Karakterden Uzun Şifre Giriniz'
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Giriş Yap',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'Kayıtlı Kullanıcı Bulunamadı';
                              loading = false;
                            });
                          }
                        }
                        // if (result == null) {
                        //   setState(() =>
                        //       error = 'Lütfen kayıtlı bir mail adresi giriniz');
                        // }
                      },
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}

class True {}
