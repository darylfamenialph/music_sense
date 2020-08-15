import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MaterialApp(
      home: MusicListLayoutWidget(),
      debugShowCheckedModeBanner: false,
    ));

class MusicListLayoutWidget extends StatefulWidget{
 
  @override
  _MusicListLayoutWidgetState createState() => _MusicListLayoutWidgetState();
}

class _MusicListLayoutWidgetState extends State<MusicListLayoutWidget> {
  List<String> list = [
    "Playlist 1",
    "Playlist 2",
    "Playlist 3",
    "Playlist 4",
    "Playlist 5",
    "Custom Playlist"
  ];


  @override
  Widget build(BuildContext context){
    return  Expanded(
            child: Container(
              color: Colors.white,
                    child: ReorderableListView(
                  children: List.generate(list.length, (index){
                    return Container(
                      key: UniqueKey(),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        key: UniqueKey(),
                        child: MusicListContent(text: list[index]),
                    ),);
                  } ), 
                  onReorder: (int oldIndex, int newIndex){
                    setState(() {
                      if(newIndex > oldIndex){
                        newIndex -= 1;
                      }
                        final String newString = list.removeAt(oldIndex);
                        list.insert(newIndex, newString);
                      
                    });
                  } ),
            ),
          );
  }
}

class MusicListContent extends StatelessWidget {

  final text;
  MusicListContent({this.text});

  @override
  Widget build(BuildContext context){
    return InkWell(
        onTap: (){},
        child: Padding( 
          padding: const EdgeInsets.all(15.0),
          key: UniqueKey(), 
          child: Row(
            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
          children: [
            Text(text,  
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
            Icon(Icons.keyboard_arrow_right, color: Colors.black54,),],
          ),
    ),
      );
  }
}