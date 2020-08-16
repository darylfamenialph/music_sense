import 'package:flutter/material.dart';
import 'package:music_sense/Model/TrendingSongsModel.dart';

abstract class IMusicList {
  Future<List<TrendingSongsModel>> fetchSongsMetadata();
  void pushToSongPreview(BuildContext context, TrendingSongsModel model);
}