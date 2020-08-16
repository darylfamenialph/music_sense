import 'package:flutter/material.dart';
import 'package:music_sense/Model/TrendingSongsModel.dart';
import 'package:music_sense/Presenter/SongDetails/SongDetailPresenter.dart';
import 'package:music_sense/View/Utilities/SizePreferences.dart';


// TrendingSongsModel model = new TrendingSongsModel(
//   "Cardigan", 
//   "Taylor Swift", 
//   "Folklore", 
//   "2020", 
//   "assets/song_album_art/folklore.png", 
//   "Yeah\nI've been tryna call\nI've been on my own for long enough\nMaybe you can show me how to love, maybe\nI'm going through withdrawals\nYou don't even have to do too much\nYou can turn me on with just a touch, baby\nI look around and\nSin City's cold and empty (Oh)\nNo one's around to judge me (Oh)\nI can't see clearly when you're gone\nI said, ooh, I'm blinded by the lights\nNo, I can't sleep until I feel your touch\nI said, ooh, I'm drowning in the night\nOh, when I'm like this, you're the one I trust\nHey, hey, hey\nI'm running out of time\nCause I can see the sun light up the sky\nSo I hit the road in overdrive, baby, oh\nThe city's cold and empty (Oh)\nNo one's around to judge me (Oh)\nI can't see clearly when you're gone\nI said, ooh, I'm blinded by the lights\nNo, I can't sleep until I feel your touch\nI said, ooh, I'm drowning in the night\nOh, when I'm like this, you're the one I trust\nI'm just walking by to let you know (By to let you know)\nI can never say it on the phone (Say it on the phone)\nWill never let you go this time (Ooh)\nI said, ooh, I'm blinded by the lights\nNo, I can't sleep until I feel your touch\nHey, hey, hey\nHey, hey, hey\nI said, ooh, I'm blinded by the lights\nNo, I can't sleep until I feel your touch");
// void main() => runApp(MaterialApp(
//   home:  SongDetailsLayout(
//     presenter: SongDetailPresenter(),
//     model: model
//     ),
// ));

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
      color: Colors.white,
      child:  Column(
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

            Container(
                    width: SizePreferences(context).GetMediaWidth() * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.deepOrange,
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Container(
                color: Colors.white.withOpacity(0.7),
                padding: const EdgeInsets.all(10.0),
                child: Text(title,
                style: TextStyle(
                  fontFamily: "Nunito-ExtraLight",
                  fontSize: 50,
                  color: Colors.black87
                ),),
              ),
              SizedBox(height: 2.0,),
              Container(
                color: Colors.deepOrange,
                padding: const EdgeInsets.all(5.0),
                child: Text("By: $artist",
                  style: TextStyle(
                    fontFamily: "Nunito-Extralight",
                    fontSize: 18,
                    color: Colors.white,
                  ),),
              ),
          ],
        ),
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
      width: double.infinity,
      height: SizePreferences(context).GetMediaHeight() * 0.4,
      child: SingleChildScrollView(
        child:
            Text(lyrics,
            style: TextStyle(
              fontFamily: "Nunito-Extralight",
              fontSize: 18,
              color: Colors.grey
            ),
            textAlign: TextAlign.center,
            ),
      ),
    );
  }
}
