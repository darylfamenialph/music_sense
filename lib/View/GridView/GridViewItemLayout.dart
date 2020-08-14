import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GridViewItemLayout extends StatelessWidget{
  final double width;
  final double height;
  final Widget child;
  final String title;
  GridViewItemLayout({@required this.child,@required this.width, @required this.height, @required this.title});

  @override
  Widget build(BuildContext context){
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(title),
            ),
            child,
          ],
        ),
      ),
    );
  }
}