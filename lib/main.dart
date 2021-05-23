//this is the start page of the project
// in the branch -dashboard in github repo pages are not corrected
//this the start page of authentication with sign also
// in the autho1 repo contain only firebase initialization
import 'package:flutter/material.dart';
import 'package:signup/screens/Landing.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Avaride());
}

class Avaride extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        //Landing page is the page which check the authentication
        home: LandingPage(),
      );
  }
}

