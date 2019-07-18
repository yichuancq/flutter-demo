import 'package:flutter/material.dart';
import 'package:untitled/tabbar/bottom_navigation_bar.dart';
import 'utils/const.dart';

// main 为程序的入口 通过 runApp() 方法执行我们的 class
void main() => runApp(new MyApp());

/* 创建一个无状态的 Widget */
class MyApp extends StatelessWidget {
  ////command+option+L 格式化代码
  @override
  Widget build(BuildContext context) {
    // 创建一个 material 风格的 app
    return new MaterialApp(
      debugShowCheckedModeBanner: false, // 去掉DEBUG 右上角 设置这一属性即可
      title: 'Demo', // 设置 App 的标题
//      theme: Constants.lightTheme,
//      theme: Constants.darkTheme,
      theme: new ThemeData(primaryColor: Colors.green), //设置主题颜色
//      home: EarthQuakeCardListView(),
//      home: EarthQuakeListView(),
      //home: new RandomWords()
//       home: new TabBarDemo(),
      home: new MyDemo(),
    );
  }
}
