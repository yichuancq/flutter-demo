import 'package:flutter/material.dart';
import 'package:untitled/tabbar/bottom_navigation_bar.dart';
import 'package:untitled/utils/const.dart';
void main() => runApp(new MyApp());

/* 创建一个无状态的 Widget */
class MyApp extends StatelessWidget {

 final String TAG="MyApp";

  ///输入法切换的快捷键 control+space
  ///command+option+L 格式化代码
  @override
  Widget build(BuildContext context) {
    // 创建一个 material 风格的 app
//    LogUtils.e(TAG, "测试日志输出");

//    getHttp();
    return new MaterialApp(
      debugShowCheckedModeBanner: false, // 去掉DEBUG 右上角 设置这一属性即可
      title: 'Demo', // 设置 App 的标题
//      theme: Constants.lightTheme,
//      theme: Constants.darkTheme,
      theme: new ThemeData(primaryColor: Colors.green), //设置主题颜色

      home: new MyDemo(),
    );
  }
}
