import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  CustomBottom({this.onTap, required this.textButtom});

  String textButtom;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        width: double.infinity,
        height: 40,
        child: Center(child: Text('$textButtom')),
      ),
    );
  }
}
