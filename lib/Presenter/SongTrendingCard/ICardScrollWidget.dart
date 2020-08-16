import '../../Model/TrendingSongsModel.dart';

abstract class ICardScrollWidget {
  Map<String,String> convertToTitleArtMap(List<TrendingSongsModel> model); 
}

