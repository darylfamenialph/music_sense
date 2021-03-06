import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'State/Home/TrendingCardState.dart';
import 'View/Home/MainEntry/MainEntry.dart';
import './Presenter/TrendingSongCards/TrendingSongCardsPresenter.dart';

void main() => runApp(MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => TrendingCardState(),
        child: MyApp(presenter: TrendingSongCardsPresenter() ,)),
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.transparent,
      ),
    ));




 