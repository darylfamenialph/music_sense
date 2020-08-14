import 'package:flutter/material.dart';
import 'dart:ui';

import '../../../Data/data.dart';
import './TrendingBarContent.dart';
import '../SongTrendingCard/SongTrendCard.dart';
import '../BottomBar/BottomBarLayout.dart';
import './TopSongs.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}


class _MyAppState extends State<MyApp> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });


    return Container(
      decoration: BoxDecoration(
         image: DecorationImage(
            image: AssetImage("assets/future_nostalgia.jpg"),
            fit: BoxFit.cover,
          ),
              ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 80.0, sigmaY: 80.0),
              child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TrendingBarContent(),
                  TopSongs(),
                  Stack(
                    children: <Widget>[
                      CardScrollWidget(currentPage: currentPage, images: images, title: title,),
                      Positioned.fill(
                        child: PageView.builder(
                          itemCount: images.length,
                          controller: controller,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return Container();
                          },
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only( top: 50.0 ),
                    child: BottomBarLayout(), //FrostedContainer(child: BottomBarWidget(),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  

 

}