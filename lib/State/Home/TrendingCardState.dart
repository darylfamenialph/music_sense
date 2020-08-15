import 'package:flutter/foundation.dart';
import 'package:music_sense/Data/data.dart';

class TrendingCardState extends ChangeNotifier
{
  double _currentIndex = images.length.toDouble() - 1;

  double getCurrentIndex() => _currentIndex;

  void updateIndex(double value)
  {
    _currentIndex = value;
    notifyListeners();
  }

}

