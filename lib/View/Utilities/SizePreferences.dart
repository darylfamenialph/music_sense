
import 'package:flutter/material.dart';

class SizePreferences {
  final BuildContext context;

  SizePreferences(this.context);

  double GetMediaHeight()
  {
    return MediaQuery.of(context).size.height;
  }

  double GetMediaWidth()
  {
    return MediaQuery.of(context).size.width;
  }


}