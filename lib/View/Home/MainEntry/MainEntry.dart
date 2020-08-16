
import 'package:flutter/material.dart';
import 'package:music_sense/Presenter/SongTrendingCard/CardScrollWidgetPresenter.dart';
import 'package:music_sense/Presenter/TrendingSongCards/TrendingSongCardsPresenter.dart';
import 'package:music_sense/State/Home/TrendingCardState.dart';
import 'package:provider/provider.dart';
import 'dart:ui';


import './TrendingBarContent.dart';
import '../SongTrendingCard/SongTrendCard.dart';
import '../BottomBar/BottomBarLayout.dart';
import './TopSongs.dart';


class MyApp extends StatefulWidget {
  final TrendingSongCardsPresenter presenter;
  MyApp({@required this.presenter});
  @override
  _MyAppState createState() => new _MyAppState(presenter);
}


class _MyAppState extends State<MyApp> {
  var currentPage = 0;
  TrendingSongCardsPresenter _presenter;
  List<String> _imageLists;
  List<dynamic> _model;
  var currentIndex = 0.0;
  var initialPage = 0;
  _MyAppState(this._presenter);

  @override
  Widget build(BuildContext context) {
    var pageState = Provider.of<TrendingCardState>(context, listen: false);
    PageController controller = PageController(initialPage: initialPage);
    controller.addListener(() {
      pageState.updateIndex(controller.page);
        setState(() {
          currentIndex = controller.page;
        });
      });

   
  
    return new FutureBuilder(
          future: _presenter.fetchTrendsMetadata(),
          builder: (context, snapshot) {
                  if(!snapshot.hasData)
                    return Center( child: new CircularProgressIndicator() );
                  else { 
                  _imageLists = _presenter.getImageLists(snapshot.data);
                   _model = snapshot.data;
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(_imageLists[currentIndex.toInt()]),
                          fit: BoxFit.cover,
                        ),
                            ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 80.0, sigmaY: 80.0),
                            child: Scaffold(
                        backgroundColor: Colors.transparent,
                      body: SafeArea(
                          child:  SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                TrendingBarContent(snapshot.data),
                                TopSongs(),
                                Stack(
                                  children: <Widget>[
                                    Consumer<TrendingCardState>(
                                      builder: (context, data, child){
                                      return CardScrollWidget(presenter: CardScrollWidgetPresenter(), currentPage: data.getCurrentIndex(), songModel: snapshot.data,);
                                      },),
                          
                                          Positioned.fill(
                                            child: PageView.builder(
                                              itemCount: _imageLists.length,
                                              controller: controller,
                                              reverse: true,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: (){ 
                                                  _presenter.pushToSongPreview(context, _model[index] );
                                                    }, 
                                                  child: Container());
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only( top: 50.0 ),
                                        child: BottomBarLayout(), 
                                      ),
                                    ],
                                  ),
                              ),
                              
                                
                            ),
                          ),
                        ),
                      );}}
                    );
                  }
                  


}