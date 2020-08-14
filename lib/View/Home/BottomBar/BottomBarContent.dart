import 'package:flutter/material.dart';

import './FrostedBottomSheetView.dart';
import '../../GridView/GridViewLayout.dart';
import '../../Utilities/FrostedContainer.dart';

class BottomBarContent extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
          children: [
            SizedBox(height: 10.0,),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 0.5,
              color: Colors.white.withOpacity(0.2),
            )
          ),

            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: FrostedContainer(
                    customBorderRadius: true,
                    bRadius: BorderRadius.all(Radius.circular(10.0)),
                    widthFactor: 1.0,
                   child: FlatButton(
                  onPressed: () {
                  _tripEditModalBottomSheet(context);
                  },
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("Recently Added", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Nunito-ExtraLight")),
      ),
                ),
              ),
            ),
          ],
    );
  }

 void _tripEditModalBottomSheet(context){
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return FrostedBottomSheetView(GridViewLayout());
    });
  }

}