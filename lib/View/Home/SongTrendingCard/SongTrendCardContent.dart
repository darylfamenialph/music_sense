import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_sense/Presenter/SongDetails/SongDetailPresenter.dart';
import 'package:music_sense/View/SongDetails/SongDetailsLayout.dart';


import '../../Utilities/FrostedIconButton.dart';


class SongDetailsWidget extends StatelessWidget{
  final title;
  final songModel;
  SongDetailsWidget({@required this.title,@required this.songModel});

  @override
  Widget build(BuildContext context){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 8.0),
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontFamily: "SF-Pro-Text-Regular")),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, bottom: 12.0),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 22.0, vertical: 6.0),
              child: FrostedIconForButton(
                IconButton(
              icon: Icon(FontAwesomeIcons.play,
                color: Colors.blueGrey,),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(
                 builder: (context)  => SongDetailsLayout(
                    presenter: SongDetailPresenter(),
                    model: songModel,
               )));
              }),
                ),
            ),
          )
        ],
      );
  }




}