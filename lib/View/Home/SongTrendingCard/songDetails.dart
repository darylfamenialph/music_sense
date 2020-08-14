import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Data/data.dart';
import '../../Utilities/frostedIconButton.dart';


class SongDetailsWidget extends StatelessWidget{
  final int titleIndex;
  SongDetailsWidget({this.titleIndex});

  @override
  Widget build(BuildContext context){
    return Row(
                          //mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(title[titleIndex],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontFamily: "SF-Pro-Text-Regular")),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, bottom: 12.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.0, vertical: 6.0),
                                child: FrostedIconForButton(
                                  IconButton(
                                icon: Icon(FontAwesomeIcons.play,
                                  color: Colors.white,),
                                onPressed: () {}),
                                  ),
                              ),
                            )
                          ],
                        );
  }

}