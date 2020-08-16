
import 'package:flutter/material.dart';

class SizePreferences {
  final BuildContext context;

  SizePreferences(this.context);

  double getMediaHeight()
  {
    return MediaQuery.of(context).size.height;
  }

  double getMediaWidth()
  {
    return MediaQuery.of(context).size.width;
  }


}