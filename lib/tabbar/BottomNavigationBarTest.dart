import 'package:flutter/material.dart';
class MyDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyDemoState();
  }
}
class MyDemoState extends State<MyDemo> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: index == 0 ? new Text("Left") : new Text("Right"),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: index,
        onTap: (int index) {
          setState((){
            this.index = index;
          });
        },
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text("Home"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            title: new Text("Search"),
          ),
        ],
      ),
    );
  }
}
