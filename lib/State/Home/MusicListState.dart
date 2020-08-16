import 'package:flutter/foundation.dart';

class MusicListState extends ChangeNotifier
{
  List<String> _titleList = [];

  List<String> getCurrentTitleList() => _titleList;

   List<String> setInitialTitleList(List<String> list)
  {
    _titleList = list;
    notifyListeners();
     return _titleList;
  }

  void removeAtIndex(int index)
  {
    _titleList.removeAt(index);
    notifyListeners();
   
  }

  void addAtIndex(int newIndex, String newString)
  {
    _titleList.insert(newIndex, newString);
    notifyListeners();
  }

  
}