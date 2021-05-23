import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:signup/Widgets/button.dart';


class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Welcome",
              style: TextStyle(
                  fontSize:20,
                  color:Colors.red,
                  fontWeight:FontWeight.bold),
            ),
          ),
         // ButtonWidget(
           // onClick: () {
           //   Navigator.push(
            //      context,
             //     MaterialPageRoute(
              //        builder: (context) => MyHomePage())
             // );
            //},
            //btnText: "LOGIN",
         // ),
        ],
      ),
    );
  }
}