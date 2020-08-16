

import 'package:flutter/material.dart';
import 'package:music_sense/Base/BasePresenter.dart';
import 'package:music_sense/Model/TrendingSongsModel.dart';
import 'package:music_sense/Presenter/SongDetails/ISongDetail.dart';

class SongDetailPresenter extends BasePresenter implements ISongDetailPresenter{
  @override
  String getSongAlbum(TrendingSongsModel model) {
      return model.songAlbum;
    }
  
    @override
    String getSongArt(TrendingSongsModel model) {
      return model.albumArt;
    }
  
    @override
    String getSongArtist(TrendingSongsModel model) {
      return model.songArtist;
    }
  
    @override
    String getSongLyricsOriginal(TrendingSongsModel model) {
      return model.songLyricsOriginal;
    }
  
    @override
    String getSongTitle(TrendingSongsModel model) {
     return model.songTitle;
  }

  @override
  void backToContext(BuildContext context) {
     Navigator.of(context).pop();
  }

  @override
  String getSongLyricsTranscribed(TrendingSongsModel model) {
      return model.songLyricsTranscribed;
    }
  
    @override
    String getSongLyricsTranslate(TrendingSongsModel model) {
    return model.songLyricsTranslate;
  }

 

  

}