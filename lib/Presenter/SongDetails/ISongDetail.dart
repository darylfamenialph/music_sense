
import 'package:flutter/cupertino.dart';

import '../../Model/TrendingSongsModel.dart';

abstract class ISongDetailPresenter {
  
  String getSongTitle(TrendingSongsModel model);
  String getSongArtist(TrendingSongsModel model);
  String getSongAlbum(TrendingSongsModel model);
  String getSongArt(TrendingSongsModel model);
  String getSongLyrics(TrendingSongsModel model);
  void backToContext(BuildContext context);
}

