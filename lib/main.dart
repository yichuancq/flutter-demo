import 'package:flutter/material.dart';

// main 为程序的入口 通过 runApp() 方法执行我们的 class
void main() => runApp(new MyApp());
/* 创建一个无状态的 Widget */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 创建一个 material 风格的 app
    return new MaterialApp(
      title: 'Demo',    // 设置 App 的标题
      theme: new ThemeData(primaryColor: Colors.orange), //设置主题颜色
      home: new TabBarDemo(),

    );
  }
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            bottom: new TabBar(
              tabs: [
                new Tab(icon: new Icon(Icons.directions_car),),
                new Tab(icon: new Icon(Icons.directions_transit),),
                new Tab(icon: new Icon(Icons.directions_bike),),
              ],
            ),
            title: new Text('Tabs Demo'),
          ),
          body: new TabBarView(
            children: [
              new Icon(Icons.directions_car),
              new Icon(Icons.directions_transit),
              new Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
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
        onTap: (int index) { setState((){ this.index = index; }); },
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
