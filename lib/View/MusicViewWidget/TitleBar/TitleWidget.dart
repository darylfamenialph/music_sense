
import 'package:flutter/material.dart';

import 'TextWidget.dart';


class WidgetTitle extends StatelessWidget{
  final title;
  final icon;
  WidgetTitle({@required this.title, @required this.icon});

  @override
  Widget build(BuildContext context){

    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0) ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 30,
              height: 30,
              child: icon, //Image.asset("assets/folklore.png",fit:BoxFit.fill),
            ),
            SizedBox(width: 20.0,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               TitleTextWidget(title: title, fontSize: 20.0, isBold: false),
              // SizedBox(height: 5.0,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

