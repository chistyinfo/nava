import 'package:flutter/material.dart';
import 'package:nava/books_tab.dart' as books;
import 'package:nava/audio_tab.dart'as audio;


void main() {
  runApp(new MaterialApp(
    home: new MyTabs(),

  ));
}
class MyTabs extends StatefulWidget{
  
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin{
  TabController controller;
  @override
  void initState(){
    super.initState();
    controller = new TabController(vsync: this, length: 2);
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Nava a digital Library"), backgroundColor: Colors.amber,
      // bottom: new TabBar(
      //   controller: controller,
      //   tabs: <Tab>[
      //     new Tab(icon: new Icon(Icons.arrow_forward)),
      //     new Tab(icon: new Icon(Icons.arrow_back)),
        
      //   ]
      // )

      ),
      bottomNavigationBar: new Material(
        color: Colors.deepOrange,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
             new Tab(icon: new Icon(Icons.book)),
             new Tab(icon: new Icon(Icons.audiotrack)),
            
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new books.BooksTab(),
          new audio.AudioTab(),
          

        ],
      ),

      );

   
  }

}
