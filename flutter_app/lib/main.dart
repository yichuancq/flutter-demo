import 'package:flutter/material.dart';


//c// main 函数为程序的入口函数，类似于 java中的 main函数，只是写法不一样了。
void main() {
  // 通过 runApp 的方法来执行我们的程序
  // runApp 传入的参数，就是我们渲染界面的代码控件了。
  runApp(new Center(child: new Text('你好，世界！', textDirection: TextDirection.ltr)));
}
