import 'package:flutter/material.dart';
import 'package:okuyan_muhendis/models/user.dart';
import 'package:okuyan_muhendis/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // return either Home or Authenticate widget
    return Authenticate();
  }
}
