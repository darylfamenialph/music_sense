import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:music_sense/View/Utilities/Constants.dart';


import 'MusicWidgetCard.dart';

// void main() => runApp(MaterialApp(
//       home: ViewWidget(),
//       debugShowCheckedModeBanner: false,
//     ));

class ViewWidget extends StatefulWidget {
  
  


  @override
  _ViewWidgetState createState() => _ViewWidgetState();
}

class _ViewWidgetState extends State<ViewWidget> {
  int _currentIndex = 0;

  var _listContent = Constants.listContent;
  var _mapContent = Constants.mapContent;

  List<T> map<T>(List list, Function handler){
    List<T> result = [];
    for(var i = 0; i < list.length; i++){
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         image: DecorationImage(
            image: AssetImage('assets/future_nostalgia.jpg'),
            fit: BoxFit.cover,
          ),
      ),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
          child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                CarouselSlider(
                  height: 150.0,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  onPageChanged: (index){
                    setState((){
                      _currentIndex = index;
                    });
                  },
                  items: _listContent.map((content){
                    return Builder(
                      builder: (BuildContext context){
                        return  Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal:10.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(3.0, 6.0),
                                  blurRadius: 10.0)
                            ]
                            ),
                            child: Column(
                                children: [
                                   MusicWidgetCard(title: content,icon: _mapContent[content],),
                                ],
                              ),
                          );
                      },
                    );
                  }).toList(),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(_listContent,(index, url){
                      return Container(
                        width: 5.0,
                        height: 5.0,
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                        decoration: BoxDecoration(shape: BoxShape.circle,
                          color: _currentIndex == index ? Colors.black54 : Colors.black12,
                        ),
                      );
                    }),
                  ),
                SizedBox(height: 75.0,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.white.withOpacity(0.1)
                    ),
                    child: FlatButton(
                     // color: Colors.white.withOpacity(0.1),
                      child: Text("Back Home", style: TextStyle(color: Colors.black45),),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
            ],
          ),
          ),
      ),
    );
  }
}