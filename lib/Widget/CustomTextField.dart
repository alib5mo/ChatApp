
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({this.onChanged,this.hintText,required this.b5});
String? hintText;
bool b5;
Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText:b5 ,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width:2,
              color: Colors.white
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
