
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
        home: LandingPage(),
      );
  }
}

