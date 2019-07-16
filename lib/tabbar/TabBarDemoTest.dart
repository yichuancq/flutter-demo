import 'package:flutter/material.dart';
import 'package:untitled/listview/earth_quake_card_listview.dart';
import 'package:untitled/listview/earth_quake_listview.dart';
class TabBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new DemoState();
  }
}
class DemoState extends State<TabBarDemo> {
  @override
  Widget build(BuildContext context) {
      return new MaterialApp(
        home: new DefaultTabController(
          length: 3,
          child: new Scaffold(
            backgroundColor: Colors.white,
            appBar: new AppBar(
              backgroundColor: Colors.green,
              bottom: new TabBar(
                tabs: [
                  new Tab(text: '最近24小时'),
                  new Tab(text: '最近48小时'),
                  new Tab(text: '专题')
                ],
              ),
            ),
            body: new TabBarView(
              children: [
                new EarthQuakeCardListView(),
                new EarthQuakeListView(),
                new Icon(Icons.person),
              ],
            ),
          ),
        ),
      );
    }
}