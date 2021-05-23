// this dart file is just a reference to the home page

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "home page",
          style: TextStyle(
            fontSize: 100.0,
            color: Colors.pink
          ),
        ),
      ),
    );
  }
}
