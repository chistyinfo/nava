import 'package:flutter/material.dart';

void main()=> runApp(Nava());

class Nava extends StatelessWidget {
  final String appTitle = 'Nava';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
     color: Colors.yellow,
      home: DefaultTabController(
        //Number of Tabs
        length: 2,
        child: new Scaffold(
          body: TabBarView(
            children: [
              new Container(
                color: Colors.yellow,
              ),
              new Container(color: Colors.white,),
              
            ],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              //1st Tab
              Tab(
                icon: new Icon(Icons.book),
              ),
              //2nd Tab
              Tab(
                icon: new Icon(Icons.audiotrack),
              ),
             
            ],
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.red,
            indicatorWeight: 5,
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}

