import 'package:flutter/material.dart';

import '../../Utilities/Constants.dart';

class TopSongs extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return  Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: topSong,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 6.0),
                        child: Text("Top Songs",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text("International",
                      style: TextStyle(color: Colors.blueAccent))
                ],
              ),
            );
  }
}