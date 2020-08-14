import 'package:flutter/material.dart';
import 'dart:ui';


class FrostedContainer extends StatelessWidget {
  final Widget child;
  FrostedContainer({this.child});
 @override
  Widget build(BuildContext context) {
    return  ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight:  Radius.circular(15.0)),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.rectangle),
                child: child)));
  }

}

