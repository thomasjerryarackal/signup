import 'package:flutter/material.dart';
import 'SignUp.dart';


void main() {
  runApp(Avaride());
}

class Avaride extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: SignUp(),
    );
  }
}

