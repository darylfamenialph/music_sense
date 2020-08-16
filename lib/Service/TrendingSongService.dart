import 'package:flutter/services.dart';

class TrendingSongService{

  Future<String> getTrendingSongs()
  {
    return rootBundle.loadString("assets/song_data_json/trending_songs_metadata.json");
  }

}