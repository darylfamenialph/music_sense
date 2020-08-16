import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_sense/View/Utilities/SizePreferences.dart';



class SongDetailsLayout extends StatelessWidget {
  final model;
  final presenter;
  SongDetailsLayout({
    @required this.presenter,
    @required this.model

  });

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
           image: DecorationImage(
              image: AssetImage(presenter.getSongArt(model)),
              fit: BoxFit.cover,
            ),
                ),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
               Container(
                 padding: const EdgeInsets.only(top: 50.0),
                  width: double.infinity,
                  height: SizePreferences(context).GetMediaHeight() * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(presenter.getSongArt(model)),
                      fit: BoxFit.cover,
                      ), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(-1, 1),
                          blurRadius: 25.0,
                          spreadRadius: 15.0
                      )],
                  ),
                  child:TitleArtist(title: presenter.getSongTitle(model), artist: presenter.getSongArtist(model),album: presenter.getSongAlbum(model),),
                  ),

              SongLyrics(presenter.getSongLyrics(model)),
              Align(
            alignment: Alignment.topCenter,
            child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 0.5,
                color: Colors.white.withOpacity(0.2),
              )
            ),
              Container(
                      width: SizePreferences(context).GetMediaWidth() * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      child: FlatButton(
                       // color: Colors.white.withOpacity(0.1),
                        child: Text("Back", style: TextStyle(color: Colors.white),),
                        onPressed: (){
                         presenter.backToContext(context);
                        },
                      ),
                    ),
              
              SizedBox(height: 1.0,),
            ],
          ),
      ),
    );
  }
}

class TitleArtist extends StatelessWidget{
  final title;
  final artist;
  final album;

  TitleArtist({@required this.title, @required this.artist, @required this.album});

  @override
  Widget build(BuildContext context){
    return Container(
      child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Container(
                color: Colors.black.withOpacity(0.3),
                width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Nunito-ExtraLight",
                    fontSize: 50,
                    color: Colors.white
                  ),),
              ),
              Container(
                color: Colors.blue.withOpacity(0.3),
                width: double.infinity,
                padding: const EdgeInsets.all(5.0),
                child: Text("By: $artist",
                textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Nunito-Extralight",
                    fontSize: 18,
                    color: Colors.white,
                  ),),
              ),
          ],
        ),
    );
  }
}

class SongLyrics extends StatelessWidget{
  final lyrics;
  SongLyrics(this.lyrics);

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: double.infinity,
      height: SizePreferences(context).GetMediaHeight() * 0.4,
      child: Scrollbar(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
          child:
              Text(lyrics,
              style: TextStyle(
                fontFamily: "Nunito-Extralight",
                fontSize: 18,
                color: Colors.white
              ),
              textAlign: TextAlign.center,
              ),
        ),
      ),
    );
  }
}
