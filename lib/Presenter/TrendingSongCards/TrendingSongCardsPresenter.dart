import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:music_sense/Base/BasePresenter.dart';
import 'package:music_sense/Model/TrendingSongsModel.dart';
import 'package:music_sense/Presenter/SongDetails/SongDetailPresenter.dart';
import 'package:music_sense/Service/TrendingSongService.dart';
import 'package:music_sense/View/SongDetails/SongDetailsLayout.dart';

import 'ITrendingSongCards.dart';

class TrendingSongCardsPresenter extends BasePresenter implements ITrendingSongCardsPresenter{
  @override
  Future<List<TrendingSongsModel>> fetchTrendsMetadata() async {
    var metadata = await TrendingSongService().getTrendingSongs();
    List<dynamic> jsonResponse = jsonDecode(metadata);
    return jsonResponse.map((e) => TrendingSongsModel.fromJson(e)).toList();
  }
  
  List<String> getSongTitles(List<TrendingSongsModel> trendsModel)
  {
    List<String> _songTitles = [];
    var _trendModel = trendsModel;

    _trendModel.forEach((element) {
      _songTitles.add(element.songTitle.toString());
    });
    
    return _songTitles;
  }

  List<String> getImageLists(List<TrendingSongsModel> trendsModel)
  {
     List<String> _albumArt = [];
    var _trendModel = trendsModel;

    _trendModel.forEach((element) {
      _albumArt.add(element.album_art.toString());
    });
    
    return _albumArt;
  }

  void pushToSongPreview(BuildContext context, TrendingSongsModel model)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SongDetailsLayout(presenter: SongDetailPresenter(), model: model)));
  }
  
}