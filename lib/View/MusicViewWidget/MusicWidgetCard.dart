import 'package:flutter/material.dart';
import 'package:music_sense/View/Utilities/MockUpPlaylist.dart';

import 'TitleBar/TitleWidget.dart';


class MusicWidgetCard extends StatelessWidget{
  final title;
  final icon;
  MusicWidgetCard({@required this.title, @required this.icon});

  @override
  Widget build(BuildContext context){
    return Column(
          children: <Widget>[
             WidgetTitle(title: title,icon: icon,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: MockUpPlaylistWidgets(),
             ),

        ],
      );;
  }
}