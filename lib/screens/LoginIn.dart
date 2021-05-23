//this is the login page


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup/Widgets/HeaderContainer.dart';
import 'package:signup/Widgets/athentication.dart';
import 'package:signup/Widgets/button.dart';
import 'package:signup/Widgets/text_input.dart';
import 'package:signup/screens/reg_page.dart';
import 'package:signup/screens/welcome.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  // form input field values instead of textcontroller
  String _regiEmail = "";
  String _regiPassword = "";
  // authentication
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthService>(context);
    return Scaffold(
      // this code is for avoiding the overflow byte
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // the container are in this stack
          Container(
            child: Stack(
                children:[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        HeaderContainer("Login"),
                      ],
                    ),
                  ),
                ]
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //add email thing
          //form widget need to wrap around container email&password
          // this key is define for authentication act as id and its global
          Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TermInput(
                    hint: "Email",
                    kicon: Icon(Icons.email),
                     onChange: (value){
                     _regiEmail=value;
                    },
                    action: TextInputAction.next,
                    valuer: (value) => value.isNotEmpty ? null : "Please enter the email"
                  ),
                  TermInput(
                    hint: "Password",
                    kicon: Icon(Icons.vpn_key),
                    onChange: (value){
                      _regiPassword=value;
                     },
                    isPassword: true,
                    valuer: (val) =>
                    val.length < 6 ? 'Password too short.' : null,
                    // onSubmit: (value){
                    //  _submit();
                    //},
                  ),

                ],
              ),
            ),
          ),
          //add buttom
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
            alignment: Alignment.centerRight,
            child: Text(
              "Forgot Password?",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
            child: Center(
              child: MaterialButton(
                onPressed:() async{
                  if(_formKey.currentState.validate()){
                    print(_regiEmail);
                    print(_regiPassword);
                    await loginProvider.login(_regiEmail.trim(), _regiPassword.trim());
                  }
                },
                minWidth:loginProvider.isLoading ?null: double.infinity,
                height: 40,
                color: Colors.orangeAccent,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:BorderRadiusDirectional.circular(100)
                ),
                child: loginProvider.isLoading ? CircularProgressIndicator() : Text("Login",style: TextStyle(fontSize: 20),),
              ),
            ),
          ),
          SizedBox(height:30),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
            alignment: Alignment.centerRight,
            child: Row(
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Don't have an account ? ",
                        style: TextStyle(
                            color: Colors.black, fontSize: 15)),
                  ]),
                ),

                OutlineButton(
                  child: Text(
                    "REGISTER",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  highlightedBorderColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegPage()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }

}

