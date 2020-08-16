import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:music_sense/Presenter/SongDetails/SongDetailPresenter.dart';
import 'package:music_sense/View/SongDetails/SongDetailsLayout.dart';
import 'package:music_sense/View/Utilities/SizePreferences.dart';

class MusicListLayoutWidget extends StatefulWidget{
  final List<dynamic> model;
  MusicListLayoutWidget({@required this.model});
  @override
  _MusicListLayoutWidgetState createState() => _MusicListLayoutWidgetState(model: model);
}

class _MusicListLayoutWidgetState extends State<MusicListLayoutWidget> {

  final List<dynamic> model;
  _MusicListLayoutWidgetState({@required this.model});
  
  List<dynamic> _model;

  @override
  void initState() {
    _model = model;
    super.initState();
  }

  @override
  Widget build(BuildContext context){
   // _model = model;
     
    return  Expanded(
              child: Container(
                height: SizePreferences(context).GetMediaHeight() * 0.8,
                color: Colors.white,
                    child: ReorderableListView(
                    header: Column(
                      children: [
                        Container(
                          color: Colors.grey[200],
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(top: 100.0, bottom: 10.0, left: 20.0),
                          child: Text("My Playlist", textAlign: TextAlign.left, style: TextStyle(fontSize: 30, color: Colors.black54,fontFamily: "Nunito-Regular"), ),
                        ),
                        Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            width: double.infinity,
                            height: 0.5,
                            color: Colors.black.withOpacity(0.2),
                          )
                        ),
                      ],
                    ),
                    children: 
                       List.generate(_model.length, (index){
                      return 
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        key: UniqueKey(),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Card(
                          key: UniqueKey(),
                          child: MusicListContent(songModel:_model[index],),
                      ),);
                        }),
                    onReorder: (int oldIndex, int newIndex){
                      setState(() {
                        if(newIndex > oldIndex){
                          newIndex -= 1;
                        }
                        final newData = _model.removeAt(oldIndex);
                        _model.insert(newIndex, newData);
                        
                      });
                    } 
                    
                    
                    ),
              ),
            );
          }
          

      
    }
  


class MusicListContent extends StatelessWidget {

  final songModel;
  MusicListContent({@required this.songModel});

  @override
  Widget build(BuildContext context){
    return InkWell(
        onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => SongDetailsLayout(presenter: SongDetailPresenter(), model: songModel)));
        },
        child: Padding( 
          padding: const EdgeInsets.all(15.0),
          key: UniqueKey(), 
          child: Row(
            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image(image: AssetImage(songModel.albumArt.toString())),
                SizedBox(width: 10,),
                Text(songModel.songTitle.toString(),  
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
              ],
            ),
            
            Icon(Icons.keyboard_arrow_right, color: Colors.black54,),],
          ),
    ),
      );
  }
}