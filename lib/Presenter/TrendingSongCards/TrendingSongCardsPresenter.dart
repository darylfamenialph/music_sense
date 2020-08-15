import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:music_sense/Base/BasePresenter.dart';
import 'package:music_sense/Model/TrendingSongsModel.dart';

import 'ITrendingSongCards.dart';

class TrendingSongCardsPresenter extends BasePresenter implements ITrendingSongCardsPresenter{
  @override
  Future<List<TrendingSongsModel>> fetchTrendsMetadata() async {
    var metadata = await rootBundle.loadString("lib/Data/trending_songs_metadata.json");
    List<dynamic> jsonResponse = jsonDecode(metadata);
    return jsonResponse.map((e) => TrendingSongsModel.fromJson(e)).toList();
  }
  
  
}