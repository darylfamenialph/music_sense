import 'package:flutter/foundation.dart';

class TrendingCardState extends ChangeNotifier
{
  double _currentIndex = 0;

  double getCurrentIndex() => _currentIndex;

  void updateIndex(double value)
  {
    _currentIndex = value;
    notifyListeners();
  }

}

