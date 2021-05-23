//IN this page contain the firebase code
//First it check the firebase connection
//by initializng the app by assign to fbapp
//Second it check if the user is register to login to move to home page
// by fetching data from the user

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup/Widgets/athentication.dart';
import 'package:signup/screens/LoginIn.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        theme: ThemeData.light(),
        home:FutureBuilder(
          future: _fbApp,
          builder: (context,snapshot) {
            // if firebase has error
            if (snapshot.hasError) {
              print("U have ${snapshot.error.toString()}");
              return Text("u have error");
            }
            // if firebase has no error  open sign in page
            else if (snapshot.connectionState == ConnectionState.done) {
              //multiprovider is a fuction in provider package
              //if the provider has connect to authentication ->moves to login page
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider<AuthService>.value(value: AuthService()),
                  StreamProvider<User>.value(
                      value: AuthService().user,
                      initialData: null)
                ],
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Login() ,
                ),
              );
            }
            // Connecting to firebase- loading
            else {
              return Center(
                child: Text("Firebase Initializing....",
                style: TextStyle(
                  fontSize: 50.0,
                  
                ),
                ),
              );
            }
          },
        )
    );
  }
}

// StreamBuilder(
//                 // this will keep track of auth changes
//                   stream: FirebaseAuth.instance.authStateChanges(),
//                 builder: (context,streamsnapshot){
//                   // if streamsnapshot has error
//                   if (streamsnapshot.hasError) {
//                    return Scaffold(
//                      body: Text(
//                          "U have ${streamsnapshot.error}",
//                        style: TextStyle(
//                          fontSize: 30.0,
//                        ),
//                      ),
//                    );
//                   }
//                   //connection state active - Do the user login check inside if statement
//                   else if (streamsnapshot.connectionState == ConnectionState.active){
//
//                     // here we get logged in user
//                     User _user =streamsnapshot.data;
//
//                     // if the user is null- not register,head to login page
//                     if(_user == null){
//                       return Login();
//                     }
//                     // if the user is logged in,head to home
//                     else{
//                       return HomePage();
//                     }
//
//                   }
//
//                   // Checking the auth state- loading
//                   else {
//                     return Center(
//                       child: Text("Stream snapshot Initializing....",
//                         style: TextStyle(
//                           fontSize: 50.0,
//
//                         ),
//                       ),
//                     );
//                   }
//
//                 },
//               );