import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';


class TubePlayer extends StatelessWidget {
  final bank;
  TubePlayer(this.bank);
  String url ='';
 
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(
          title: Text(bank['name']),
        ),
         body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              YoutubePlayer(
                context: context,
                source: (bank['URl']),
                quality: YoutubeQuality.HD,
              ),
            
              
            ],
          ),
        ));
      
    
  }
}

