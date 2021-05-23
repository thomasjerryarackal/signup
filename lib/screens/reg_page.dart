// this the registration page


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:signup/Widgets/HeaderContainer.dart';
import 'package:signup/Widgets/athentication.dart';
import 'package:signup/Widgets/text_input.dart';
import 'package:signup/screens/LoginIn.dart';


class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {

  // form input field values values
  String _regiEmail = "";
  String _regiPassword = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final regiProvider = Provider.of<AuthService>(context);
    final loginProvider = Provider.of<AuthService>(context);
    return Scaffold(
      // this code is for avoiding the overflow byte
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Register"),
            Expanded(
              flex: 2,
              child: Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      //this is fuction from text_input.dART
                      TermInput(
                          hint: "Email",
                          kicon: Icon(Icons.email),
                        onChange: (value){
                            _regiEmail=value;
                        },
                        action: TextInputAction.next,
                      ),
                      TermInput(
                          hint: "Password",
                          kicon: Icon(Icons.vpn_key),
                        onChange: (value){
                            _regiPassword=value;
                        },
                        isPassword: true,

                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child:  MaterialButton(
                            onPressed:() async{
                              if(_formKey.currentState.validate()){
                                print(_regiEmail);
                                print(_regiPassword);
                                await regiProvider.register(_regiEmail.trim(), _regiPassword.trim());
                              }
                            },
                            minWidth:regiProvider.isLoading ?null: double.infinity,
                            height: 40,
                            color: Colors.orangeAccent,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:BorderRadiusDirectional.circular(100)
                            ),
                            child: regiProvider.isLoading ? CircularProgressIndicator() : Text("Login",style: TextStyle(fontSize: 20),),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Already a member ? ",
                                    style: TextStyle(color: Colors.black,fontSize: 15.0)),

                              ]),
                            ),
                            OutlineButton(
                              child: Text("LOGIN", style: TextStyle(fontSize: 15.0),),
                              highlightedBorderColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },

                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      // this dialog box to shoe error
                      if(loginProvider.errorMessage != null)
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        color: Colors.amberAccent,
                        child: ListTile(
                          title: Text(loginProvider.errorMessage),
                          leading: Icon(Icons.error),
                          trailing: IconButton(
                              onPressed:()=> loginProvider.setMessage(null),
                              icon: Icon(Icons.close)),
                        ),

                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
