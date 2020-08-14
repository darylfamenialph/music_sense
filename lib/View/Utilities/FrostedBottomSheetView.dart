import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedBottomSheetView extends StatelessWidget{
  final Widget viewWidget;
  FrostedBottomSheetView(this.viewWidget);

  @override
  Widget build(BuildContext context){
    return Container(
      child: BackdropFilter(
           filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: 
                      IconButton(
                        icon: Icon(Icons.close, color:Colors.grey, size: 25),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      ),
                  ),
                  SizedBox(height: 50.0,),
                 viewWidget,
                ],
              ),
            ),
          ),
      ),
    );


 
    
  }

   
}