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
      theme: new ThemeData(primaryColor: Colors.orange),  // 设置主题颜色

      // Scaffold 存在于 Material 库中。实现了基本的 material 布局。
      // 可以使用 scaffold 实现比较复杂的布局，可以先简单理解 scaffold 为一个容器，可以在上面实现布局
      home: new MyHomePage(),

    );
  }
}
class MyHomePage extends StatelessWidget {
  SelecteView(IconData icon, String text, String id){
    return new PopupMenuItem<String>(
      value: id,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Icon(
            icon,
            color: Colors.blue,
          ),
          new Text(text)
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      //AppBar
      appBar: new AppBar(
        leading: new Icon(Icons.home),
        title: new Text('fultter demo'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: <Widget>[
          //非隐藏菜单
          new IconButton(
            icon: new Icon(Icons.add_alarm),
            tooltip: 'Add Alarm',
            onPressed: (){

            },
          ),
          //隐藏菜单
          new PopupMenuButton<String>(
            itemBuilder:(BuildContext context) =><PopupMenuItem<String>>[
              this.SelecteView(Icons.message, '发起群聊', 'A'),
              this.SelecteView(Icons.group_add, '添加服务', 'B'),
              this.SelecteView(Icons.cast_connected,'扫一扫码','C'),
            ],
            onSelected: (String action){
              switch (action) {
                case 'A':
                  {
                    print('发起群聊');
                  }
                  break;

                case 'B':
                  {
                    print('添加服务');
                  }
                  break;
                case  'C':
                  {
                    print('扫一扫');
                  }
                  break;
                default:
              }
            },
          )
        ],
      ),
      //draw
      drawer:null,

      //Body
      body:null,
      //NavigationBar
      bottomNavigationBar: null,
    );
  }
}