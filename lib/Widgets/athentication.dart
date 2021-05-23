import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//This class contains all the app state managing methods and variables and objects-changenotifier
class AuthService with ChangeNotifier{
  bool _isLoading = false;
  String _errorMessage ;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
// creating a variable for firebaseAuth package
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // function to create a account in firebase
  Future register (String email , String password) async {
    setLoading(true);
    try{
      UserCredential _authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,password: password
      );
      User _user = _authResult.user;
      setLoading(false);
      return _user;
    }catch(e){
      setLoading(false);
      print(e);
      setMessage(e.message);
    }
    notifyListeners();
  }
// function to sign in -in the account of firebase
  Future login (String email , String password) async {
    setLoading(true);
    try{
      UserCredential _authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: email,password: password
      );
      User _user = _authResult.user;
      setLoading(false);
      return _user;
    }catch(e){
      setLoading(false);
      print(e);
      setMessage(e.message);
    }
    //to notify all the widgets who are listening to that particular change
    // so that the UI can be rebuilt and updated.
    notifyListeners();
  }

  // function to sign out
  Future logout () async{
    await FirebaseAuth.instance.signOut();

  }
// custom function create to call notifylisteners
  void setLoading(val){
    _isLoading = val;
    notifyListeners();
  }
   void setMessage(val){
    _errorMessage = val;
    notifyListeners();
   }


   Stream<User> get  user =>
       firebaseAuth.authStateChanges().map((event) => event);



}