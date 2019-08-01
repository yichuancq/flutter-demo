import 'package:flutter/material.dart';
import 'package:untitled/tabbar/bottom_navigation_bar.dart';
import 'package:untitled/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'map/gaode_map.dart';

void main() => runApp(new MyApp());

//https://www.jianshu.com/p/13e62e36614b
/* 创建一个无状态的 Widget */
class MyApp extends StatelessWidget {


//  SliverAppBar
  // var screenWidth = MediaQuery.of(context).size.width;
  final String TAG = "MyApp";

  ///输入法切换的快捷键 control+space
  ///command+option+L 格式化代码
  @override
  Widget build(BuildContext context) {
    // 创建一个 material 风格的 app
//    LogUtils.e(TAG, "测试日志输出");
     //AMapLocationClient.setApiKey("1e3f73bf84d8d178a1e4f9cd86c3ff6d");
//    getHttp();
    return new MaterialApp(
      debugShowCheckedModeBanner: false, // 去掉DEBUG 右上角 设置这一属性即可
      title: 'Demo', // 设置 App 的标题
//      theme: Constants.lightTheme,
//      theme: Constants.darkTheme,
      theme: new ThemeData(primaryColor: Colors.green), //设置主题颜色

      home: new MyDemo(),
//      home: MapPage(title: '高德地图测试'),
    );
  }
}
