import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:music_sense/Model/TrendingSongsModel.dart';
import 'package:music_sense/Presenter/MusicList/IMusicList.dart';
import 'package:music_sense/Service/TrendingSongService.dart';

class MusicListPresenter implements IMusicList{

  @override
  Future<List<TrendingSongsModel>> fetchSongsMetadata() async {
    var metadata = await TrendingSongService().getTrendingSongs();
    List<dynamic> jsonResponse = jsonDecode(metadata);
    return jsonResponse.map((e) => TrendingSongsModel.fromJson(e)).toList();
  }

  @override
  void pushToSongPreview(BuildContext context, TrendingSongsModel model) {
    // TODO: implement pushToSongPreview
  }

  

}