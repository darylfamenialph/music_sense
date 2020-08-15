import 'package:music_sense/Model/TrendingSongsModel.dart';

import './ICardScrollWidget.dart';

class CardScrollWidgetPresenter implements ICardScrollWidget{
  @override
  Map<String, String> convertToTitleArtMap(List<TrendingSongsModel> model) {
    var _model = model;
    return Map.fromIterable(_model, key: (e) => e.songTitle, value: (e) => e.albumArt );
  }

}