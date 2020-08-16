
import 'package:flutter/cupertino.dart';

import '../../Model/TrendingSongsModel.dart';

abstract class ISongDetailPresenter {
  
  String getSongTitle(TrendingSongsModel model);
  String getSongArtist(TrendingSongsModel model);
  String getSongAlbum(TrendingSongsModel model);
  String getSongArt(TrendingSongsModel model);
  String getSongLyricsOriginal(TrendingSongsModel model);
  String getSongLyricsTranscribed(TrendingSongsModel model);
  String getSongLyricsTranslate(TrendingSongsModel model);
  void backToContext(BuildContext context);



}

