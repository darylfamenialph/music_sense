import 'package:flutter/material.dart';

import 'BottomBarContent.dart';

class BottomBarLayout extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                //width: 50,
                  //width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))
                  ),
                  child:
                  BottomBarContent(),
                ));
  }
}