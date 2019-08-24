import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';


class TubePlayer extends StatelessWidget {
  final databox;
  TubePlayer(this.databox);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(
          title: Text(databox['name']),
        ),
         body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              YoutubePlayer(
                context: context,
                source: (databox['URl']),
                quality: YoutubeQuality.HD,
              ), 
            ],
          ),
        ));

      
    
  }
}

