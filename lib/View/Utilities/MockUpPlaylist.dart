import 'package:flutter/material.dart';

class MockUpPlaylistWidgets extends StatelessWidget{


  @override
  Widget build(BuildContext context){
    return Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                    MockUpPlaylistContent(),
                    MockUpPlaylistContent(),
                    MockUpPlaylistContent(),
                    MockUpPlaylistContent(),
               ],
             );
  }
}

class MockUpPlaylistContent extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Container( 
                  decoration: BoxDecoration(
                    color: Colors.pink.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon( Icons.music_note, size: 50.0, color: Colors.deepOrange.withOpacity(0.5) , ),
                ));
  }
}