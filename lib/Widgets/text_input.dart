// this is the part of the registration and login form
//this is function that takes the layout and take value in the form

import 'package:flutter/material.dart';

class TermInput extends StatelessWidget {
  final String hint;
  final Icon kicon;
  final Function(String) onChange;
  final Function(String) onSubmit;
  final Function(String) valuer;
  final TextInputAction action;
  final bool isPassword;

  TermInput({this.valuer,this.kicon,this.hint,this.onChange,this.onSubmit,this.action,this.isPassword});
  @override
  Widget build(BuildContext context) {
    bool _isPassword = isPassword ?? false;

    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        obscureText: _isPassword,
        validator: valuer,
        textInputAction: action,
        onChanged: onChange,
        onFieldSubmitted: onSubmit,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: kicon,
        ),
      ),
    );
  }
}
