// this is part of the sign and registration page
// its the orange shape in the top of each form

import 'package:flutter/material.dart';
import 'package:signup/Widgets/colors.dart';

class HeaderContainer extends StatelessWidget {
  var text = "Login";

  HeaderContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColors, orangeLightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                text,
                style: TextStyle(color: Colors.white,fontSize: 20),
              )),
          Center(
            //child: Image.asset("assets/logo.png"),
          ),
        ],
      ),
    );
  }
}