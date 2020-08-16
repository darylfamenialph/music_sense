import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget{
  final String title;
  final double fontSize;
  final bool isBold;

  TitleTextWidget({@required this.title, this.fontSize, this.isBold});

  @override
  Widget build(BuildContext context){
    return Text(
      title,
      style: TextStyle(
        fontFamily: isBold ? "Nunito-Regular" : "Nunito-ExtraLight",
        fontSize: fontSize,
        color: Colors.black87,
      ),

    );
  }
}