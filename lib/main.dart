import 'package:flutter/material.dart';
//import 'package:untitled/listview/RandomWords.dart';
import 'listview/RandomWords.dart';
import 'utils/const.dart';
// main 为程序的入口 通过 runApp() 方法执行我们的 class
void main() => runApp(new MyApp());
/* 创建一个无状态的 Widget */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 创建一个 material 风格的 app
    return new MaterialApp(
      title: 'Demo',    // 设置 App 的标题
      theme: Constants.lightTheme,
     // theme: new ThemeData(primaryColor: Colors.teal), //设置主题颜色
      debugShowCheckedModeBanner: false, // 去掉DEBUG 右上角 设置这一属性即可
      home: new RandomWords()
      // home: new TabBarDemo(),
    );
  }
}
