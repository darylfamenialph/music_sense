import 'package:flutter/material.dart';
import 'dart:ui';


class FrostedContainer extends StatelessWidget {
  final Widget child;
  final bool customBorderRadius;
  final BorderRadius bRadius;
  final double widthFactor;
  
  FrostedContainer({@required this.child,@required this.customBorderRadius, this.bRadius, this.widthFactor});
 @override
  Widget build(BuildContext context) {
    return  ClipRRect(
        borderRadius: customBorderRadius ? bRadius : BorderRadius.only(topLeft: Radius.circular(15.0), topRight:  Radius.circular(15.0)),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              width: MediaQuery.of(context).size.width * widthFactor,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2) ,
                    shape: BoxShape.rectangle),
                child: child)));
  }

}

