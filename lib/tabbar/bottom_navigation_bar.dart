import 'package:flutter/material.dart';
import 'package:untitled/dropdownmenu/drop_down_menu.dart';
import 'package:untitled/listview/earth_quake_card_listview.dart';
import 'package:untitled/listview/earth_quake_card_refresh_listview.dart';
import 'package:untitled/me/me.dart';
import 'package:untitled/topic/topic.dart';

class MyDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyDemoState();
  }
}

class MyDemoState extends State<MyDemo> {
  int index = 0;

  buildBodyPage() {
    if (index == 0) {
      return new DropDownMenu();
    }
    if (index == 1) {
      return new TopicListView();
    }
    if (index == 2) {
      return new MeListView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: buildBodyPage(),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: index,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
        },
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.message),
            title: new Text("消息", style: TextStyle(color: Colors.grey)),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.toys),
            title: new Text("专题", style: TextStyle(color: Colors.grey)),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text("我", style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
