import 'package:flutter/material.dart';
import 'package:music_sense/State/Home/TrendingCardState.dart';
import 'package:provider/provider.dart';
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
  //var currentPage = images.length - 1.0;
  var currentIndex = images.length - 1.0;
  
  @override
  Widget build(BuildContext context) {
    var pageState = Provider.of<TrendingCardState>(context, listen: false);
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      pageState.updateIndex(controller.page);
      setState(() {
        currentIndex = controller.page;
      });
    });

    return Container(
      decoration: BoxDecoration(
         image: DecorationImage(
            image: AssetImage(images[currentIndex.toInt()]),
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
                      Consumer<TrendingCardState>(
                        builder: (context, data, child){
                        return CardScrollWidget(currentPage: data.getCurrentIndex(), images: images, title: title,);
                        },),
                      
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