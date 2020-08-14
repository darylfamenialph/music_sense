import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


import '../../Data/data.dart';
import 'TitleBar/widgetTitle.dart';

// void main() => runApp(MaterialApp(
//       home: ViewWidget(),
//       debugShowCheckedModeBanner: false,
//     ));


class ViewWidget extends StatelessWidget {
  final _current = 0;

  List imgList = images;
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
        color: Colors.white),
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
               // setState((){
                //  _current = index;
               // });
              },
              items: imgList.map((imgUrl){
                return Builder(
                  builder: (BuildContext context){
                    return  Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal:10.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Color.fromARGB(255, 235, 33, 57),
                            Color.fromARGB(255, 235, 33, 57),
                          ]),
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
                              WidgetTitle(),
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
                children: map<Widget>(imgList,(index, url){
                  return Container(
                    width: 5.0,
                    height: 5.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    decoration: BoxDecoration(shape: BoxShape.circle,
                      color: _current == index ? Colors.black : Colors.grey,
                    ),
                  );
                }),
              ),

        ],
      ),
      );
  }
}