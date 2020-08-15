
import 'package:flutter/material.dart';

import 'TextWidget.dart';


class WidgetTitle extends StatelessWidget{
  final title;
  final subtitle;
  WidgetTitle({@required this.title, @required this.subtitle});

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
              child:  Image.asset("assets/folklore.png",fit:BoxFit.fill),
            ),
            SizedBox(width: 20.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               TitleTextWidget(title: "Playlist", fontSize: 12.0, isBold: true),
               SizedBox(height: 5.0,),
               TitleTextWidget(title: "Apple Music", fontSize: 10.0, isBold: false),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

