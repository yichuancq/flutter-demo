//地震消息listView
import 'package:flutter/cupertino.dart';
import 'package:untitled/model/earth_quake_model.dart';
import 'package:flutter/material.dart';
class EarthQuakeCardListView extends StatefulWidget{
  //
  @override
  State<StatefulWidget> createState() {
    //
    return new EarthQuakeCardListViewState();
  }
}
// step2
class EarthQuakeCardListViewState extends State<EarthQuakeCardListView>{
  //自定义一个数据集合
  List earthInfoList = [];

  @override
  void initState() {
    print("on initState...");
    for (int i = 0; i < 20; i++) {
      EarthQuakeInfo quakeInfo=new EarthQuakeInfo();
      quakeInfo.degree=0.98+i;
      quakeInfo.depths=10;
      quakeInfo.happenTime="2019-08-12 12:23:34";
      quakeInfo.happenPlace="test";
      earthInfoList.add(quakeInfo);
    }
    super.initState();
  }
  void doNavigator() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new SecNextPage();
    }));
  }
  //构造数据
  getRowData(int position) {
    EarthQuakeInfo quakeInfo=earthInfoList[position];
    return GestureDetector(
      child: Padding(
          //padding: EdgeInsets.all(5.0),
        child:buildRows(quakeInfo)

      ),
    );
  }
  buildRows(EarthQuakeInfo earthQuakeInfo) {
    var row = Container(
      margin: EdgeInsets.all(4.0),
//      padding: EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            // borderRadius: BorderRadius.circular(40.0),
              borderRadius: BorderRadius.circular(4.0),
              child: Image.asset("assets/head1.png",width: 80, height: 80,
                fit: BoxFit.fill,
              ),
          ),

          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 8.0),
//            width: 200,
              height: 80.0,

                child: Column(
//                  // 从左到右
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
//                      Expanded(
//                        child:
//                        new Container(
//                          child: new Row(
//                            mainAxisAlignment:  MainAxisAlignment.start,
//                            children: [
//                              new Row(
//                                // 对齐方式
//                                  children: <Widget>[
//                                    Text("震级:",style: TextStyle(color:Colors.orange,fontWeight: FontWeight.bold, fontSize: 15.0)),
//                                    Text(earthQuakeInfo.degree.toString()),
//                                  ]
//                              ),
//                             // margin: EdgeInsets.only(left: 8.0),
//                              new Row(
//                                // 对齐方式
//                                  children: <Widget>[
//                                    Text("深度:",style: TextStyle(color:Colors.green,fontWeight: FontWeight.bold, fontSize: 15.0)),
//                                    Text(earthQuakeInfo.depths.toString()),
//                                  ]
//                              )],
//                          ),
//                        ),
//                      ),

                      //内嵌布局
                      Expanded(

                        child: Container(
                          child: new Row(
                            // 对齐方式
                              mainAxisAlignment: MainAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("震级：",style: TextStyle(color:Colors.orange,fontWeight: FontWeight.bold, fontSize: 17.0)),
                                Text(earthQuakeInfo.degree.toString()),
                              ]
                          ),


                        ),
                      ),
                      //内嵌布局
                      Expanded(
                        child: Container(
                          child: Row(
                            // 对齐方式
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // 从左到右
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("深度：",style: TextStyle(color:Colors.green, fontWeight: FontWeight.bold, fontSize: 17.0)),
                                Text(earthQuakeInfo.depths.toString()),

                              ]
                          ),
                        ),
                      ),

                      Text("发生地点:"+earthQuakeInfo.happenPlace),
                      Text("发生时间:"+earthQuakeInfo.happenTime),

                    ]
                )
            ),
          ),
        ],
      ),
    );
    return Card(

      child: row,
    );
  }
  //实现构建方法
  viewBuild() {
    if (earthInfoList.length != 0) {
      return ListView.builder(
          itemCount: earthInfoList.length,
          itemBuilder: (BuildContext context, int position) {
            return buildRows(earthInfoList[position]);
          });
    } else {
      // 加载菊花
      return CupertinoActivityIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("地震消息显示",style: TextStyle(fontSize: 15)),
      ),

      body: Center(
        //条目
        child: viewBuild(),
      ),
    );
  }
}

// 实现已保存数据的页面
class SecNextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("详情查看",style: TextStyle(fontSize: 15)),
      ),
    );
  }
}
