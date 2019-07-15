import 'package:flutter/material.dart';
class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: 4,
        child: new Scaffold(
          appBar: new AppBar(
            bottom: new TabBar(
              tabs: [
                new Tab(text: '首页',icon: new Icon(Icons.home)),
                new Tab(text: '订单',icon: new Icon(Icons.search)),
                new Tab(text: '推荐',icon: new Icon(Icons.receipt)),
                new Tab(text: '我',icon: new Icon(Icons.person))

              ],

            ),

            //title: new Text('Tabs Demo'),
          ),


          body: new TabBarView(
            children: [
              new Icon(Icons.home) ,
              new Icon(Icons.search),
              new Icon(Icons.receipt),
              new Icon(Icons.person),
            ],
          ),
        ),
      ),
    );
  }
}
