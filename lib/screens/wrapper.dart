import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup/screens/HomePage.dart';
import 'package:signup/screens/LoginIn.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User>(context);
    if(_user != null)
      {
        return HomePage();
      }else{
      return Login();
    }
  }
}
