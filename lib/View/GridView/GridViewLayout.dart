import 'package:flutter/material.dart';

import './GridViewItemLayout.dart';

class GridViewLayout extends StatelessWidget{

@override
Widget build(BuildContext context){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [ 
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GridViewItemLayout(
            child: Text(""),
            height: 120,
            width: 120,
            title: "asdfss",
          ),
          
         GridViewItemLayout(
            child: Text(""),
            height: 120,
            width: 120,
            title: "asdfs"
          ),
        ],
      ),
      SizedBox(height: 20.0,),
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GridViewItemLayout(
            child: Text(""),
            height: 120,
            width: 120,
            title: "asdfs"
          ),
          GridViewItemLayout(
            child: Text(""),
            height: 120,
            width: 120,
            title: "asdfs"
          ),
        ],
      ),
    ],
  );
}
}