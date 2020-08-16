import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_sense/View/Utilities/SizePreferences.dart';
import 'package:audioplayers/audio_cache.dart';



class SongDetailsLayout extends StatefulWidget {
  final model;
  final presenter;
  SongDetailsLayout({
    @required this.presenter,
    @required this.model

  });

  @override
  _SongDetailsLayoutState createState() => _SongDetailsLayoutState();
}

class _SongDetailsLayoutState extends State<SongDetailsLayout> {
 final player = AudioCache(prefix: 'song_mp3/');
  var playerInstance;
  bool _isPlaying = false;
  String currentTime = "00:00";
  String completeTime = "00:00";

  final _controller = PageController(initialPage: 0);
  
  @override
  void initState()
  {
    player.load('${widget.model.mp3Filename}.mp3');
    print("Data Initialized");
    super.initState();
  }

  @override
  void dispose(){
    if(playerInstance != null)
      playerInstance.clear('${widget.model.mp3Filename}.mp3');
      print("Data Disposed");
      super.dispose();
    }


  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
           image: DecorationImage(
              image: AssetImage(widget.presenter.getSongArt(widget.model)),
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
                  height: SizePreferences(context).getMediaHeight() * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(widget.presenter.getSongArt(widget.model)),
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
                  child:TitleArtist(title: widget.presenter.getSongTitle(widget.model), artist: widget.presenter.getSongArtist(widget.model),album: widget.presenter.getSongAlbum(widget.model),),
                  ),

              Container(
                height: SizePreferences(context).getMediaHeight() * 0.4,
                child: PageView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[ 
                    SongLyrics(lyrics: widget.presenter.getSongLyricsOriginal(widget.model), lyricsType: "Original"),
                    SongLyrics(lyrics: widget.presenter.getSongLyricsTranscribed(widget.model), lyricsType: "Transcribed",),
                    SongLyrics(lyrics: widget.presenter.getSongLyricsTranslate(widget.model), lyricsType: "Translated",)
                  ]),
              ),
              Align(
            alignment: Alignment.topCenter,
            child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 0.5,
                color: Colors.white.withOpacity(0.2),
              )
            ), Container(
                  width: SizePreferences(context).getMediaWidth() * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.blue[500].withOpacity(0.9),
                  ),
                  child: FlatButton(
                    child: Text( _isPlaying ? "Pause" : "Play", style: TextStyle(color: Colors.white),),
                    onPressed: (){
                      
                      setState(() {
                        if(_isPlaying)
                       {
                         playerInstance.pause();
                         _isPlaying = false;
                       }
                       else
                       {
                         player.play('${widget.model.mp3Filename}.mp3').then((value) => playerInstance = value);
                           _isPlaying = true;
                       }
                      });  
                    },
                  ),
                ),
              Container(
                  width: SizePreferences(context).getMediaWidth() * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: FlatButton(
                    child: Text("Back", style: TextStyle(color: Colors.white),),
                    onPressed: (){
                      widget.presenter.backToContext(context);
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
                color: Colors.black.withOpacity(0.7),
                width: double.infinity,
                padding: const EdgeInsets.all(5.0),
                child: Text("By: $artist",
                textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Nunito-Regular",
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
  final lyricsType;
  SongLyrics({this.lyrics, this.lyricsType});

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          width: double.infinity,
          height: SizePreferences(context).getMediaHeight() * 0.35,
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
        ),
        Container(
          width: 100,
          padding: const EdgeInsets.all(5),
          height: SizePreferences(context).getMediaHeight() * 0.4 - SizePreferences(context).getMediaHeight() * 0.35,
          child: Align(alignment: Alignment.center, child: Text(lyricsType, style: TextStyle(color:Colors.deepOrange, fontFamily: "Nunito-Extralight",letterSpacing: 1, fontSize: 15),))
          ),
      ],
    );
  }
}
