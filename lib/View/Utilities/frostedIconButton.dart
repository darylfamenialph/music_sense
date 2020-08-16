import 'package:flutter/material.dart';
import 'dart:ui';


class FrostedIconForButton extends StatelessWidget {
  final Widget child;
  FrostedIconForButton(this.child);
 @override
  Widget build(BuildContext context) {
    return  ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
                // width: 50.0,
                // height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.rectangle),
                child: child)));
  }

}