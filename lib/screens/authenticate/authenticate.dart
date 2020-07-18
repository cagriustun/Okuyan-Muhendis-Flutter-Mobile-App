import 'package:flutter/material.dart';
import 'package:okuyan_muhendis/screens/authenticate/sign_in.dart';
import 'package:okuyan_muhendis/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSingIn = true;
  void toggleView() {
    setState(() => showSingIn = !showSingIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSingIn) {
      return Signin(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
