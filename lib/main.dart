import 'package:flutter/material.dart';
import 'package:nava/books_tab.dart' as books;
import 'package:nava/audio_tab.dart' as audio;


void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyTabs(),
  ));
}

class MyTabs extends StatefulWidget {
  
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Nava a digital Library"),
        backgroundColor: Colors.amber,
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
          new audio.AudioTab(),
          new books.BooksTab(),
          
        ],
      ),
    );
  }
}
