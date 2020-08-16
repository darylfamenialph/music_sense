import 'package:flutter/material.dart';
import 'package:music_sense/View/MusicViewWidget/MusicWidgetLayout.dart';
import '../../Utilities/CustomIcons.dart';

class TrendingBarContent extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12.0, top: 50.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Trending",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 46.0,
                            fontFamily: "Calibre-Semibold",
                            letterSpacing: 1.0,
                          )),
                      IconButton(
                        icon: Icon(
                          CustomIcons.option,
                          size: 12.0,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _tripEditModalBottomSheet(context);
                        },
                      )
                    ],
                  ),
                );

  }

  
 void _tripEditModalBottomSheet(context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewWidget()));
  }
}