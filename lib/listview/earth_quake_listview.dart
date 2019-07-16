//地震消息listView
import 'package:flutter/cupertino.dart';
import 'package:untitled/model/earth_quake_model.dart';
import 'package:flutter/material.dart';

class EarthQuakeListView extends StatefulWidget{
  //
  @override
  State<StatefulWidget> createState() {
    //
    return new EarthQuakeListViewState();
  }
}
// step2
class EarthQuakeListViewState extends State<EarthQuakeListView>{

  //自定义一个数据集合
  List earthInfoList = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 30; i++) {
      EarthQuakeInfo quakeInfo=new EarthQuakeInfo();
      quakeInfo.degree=0.98;
      quakeInfo.depths=10;
      quakeInfo.happenTime="2019-08-12 12:23:34";
      quakeInfo.happenPlace="test";
      earthInfoList.add(quakeInfo);
    }
  }
  //构造item
  Widget buildRow(EarthQuakeInfo earthQuakeInfo) {

    return new ListTile(
      onLongPress:(){
        print("on Pressed...");
        // 实现页面跳转的函数

      },
      //on click
      onTap: (){
        Navigator
            .of(context)
            .push(new MaterialPageRoute(builder: (context) {
          return new SecNextPage();
        }));
      },
      title: new Text("地震强度:"+  (earthQuakeInfo.degree.toString()),
          style: TextStyle(color: Colors.teal,fontSize: 15 )),

      subtitle: new Text("发生时间：" +earthQuakeInfo.happenTime,
          style: TextStyle(color: Colors.grey,fontSize: 13 )),
      trailing: new Icon(Icons.navigate_next)
    );

  }
  //构造数据
  getRowData(int position) {
    EarthQuakeInfo quakeInfo=earthInfoList[position];
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        //child: Text("行号：$i"),
        child:buildRow(quakeInfo)
      ),
    );
  }
  // 实现构建方法
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("地震消息显示",style: TextStyle(fontSize: 15)),
      ),
      body: ListView.builder(
        //条目
        itemCount: earthInfoList.length,
        itemBuilder: (BuildContext context, int position) {
          return getRowData(position);
        },
      ),
    );
  }
}

// 实现已保存数据的页面
class SecNextPage extends StatelessWidget {
  // 声明类的参数
  //SavedPage();
  // 渲染一个列表
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: Text("详情查看",style: TextStyle(fontSize: 15)),
      ),
    );
  }
}
