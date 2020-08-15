import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  home: SongDetailsLayout(),
));

class SongDetailsLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    boxShadow: [

                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(-1, 1),
                        blurRadius: 10.0,
                        spreadRadius: 5.0
                    )],
                ),
                child: Image.asset("assets/folklore.png")
                ),),

            Text("Cardigan",
            style: TextStyle(
              fontFamily: "Nunito-ExtraLight",
              fontSize: 50,
              color: Colors.black87
            ),),

            Text("By Taylor Swift",
            style: TextStyle(
              fontFamily: "Nunito-Extralight",
              fontSize: 18,
              color: Colors.grey
            ),),

            SizedBox(height: 20.0,),

            

          ],
        ),
      ),
    );
  }
}