import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedBottomSheetView extends StatelessWidget{
  final Widget viewWidget;
  FrostedBottomSheetView(this.viewWidget);

  @override
  Widget build(BuildContext context){
    return Container(
      child: BackdropFilter(
           filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
            child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 30,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child:  Container(
                            width: 70.0,
                            height: 5.0,
                            color: Colors.black.withOpacity(0.2),
                          ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top:5.0, right:5.0),
                          child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.black.withOpacity(0.2),
                                  child: IconButton(
                                  icon: Icon(Icons.close, color:Colors.white54, size: 15,),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                              ),
                                ),
                            ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.0,),
                  Center(
                    child: Column(
                      children: <Widget>[
                        Text("This Page is not yet implemented"),
                        SizedBox(height: 10.0,),
                        Container(
                          child: FlatButton(
                            color: Colors.black.withOpacity(0.2),
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                          child: Text("Go Back", style: TextStyle(color: Colors.white60),),
                    ),
                  ),
                      ],
                    ),
                  ),
                  
                 //viewWidget,
                ],
              ),
            ),
          ),
      ),
    );


 
    
  }

   
}