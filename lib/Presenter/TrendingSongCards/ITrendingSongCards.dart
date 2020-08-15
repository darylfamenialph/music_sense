
import '../../Model/TrendingSongsModel.dart';

abstract class ITrendingSongCardsPresenter {
  Future<List<TrendingSongsModel>> fetchTrendsMetadata();
  List<String> getSongTitles(List<TrendingSongsModel> trendsModel);
  List<String> getImageLists(List<TrendingSongsModel> trendsModel);
}

