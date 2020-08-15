
import '../../Model/TrendingSongsModel.dart';

abstract class ITrendingSongCardsPresenter {
  Future<List<TrendingSongsModel>> fetchTrendsMetadata();
}

