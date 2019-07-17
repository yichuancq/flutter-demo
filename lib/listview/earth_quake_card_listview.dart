//地震消息listView
import 'package:flutter/cupertino.dart';
import 'package:untitled/model/earth_quake_model.dart';
import 'package:flutter/material.dart';
import 'earth_quake_listview.dart';
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
  //
  buildRows(final int position) {
    EarthQuakeInfo earthQuakeInfo=  earthInfoList[position];
    var row = Container(

      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            // borderRadius: BorderRadius.circular(40.0),
              borderRadius: BorderRadius.circular(4.0),
              child:
                 Image.asset("assets/head1.png",width: 80, height: 80,
                fit: BoxFit.fill,
              ),
          ),

          Expanded(
            //设置弹性系数
            flex: 10,
            child: Container(
                margin: EdgeInsets.only(left: 4.0,right: 4.0),
            width: 200,
//            color: Colors.red,
              height: 85.0,
                child: Column(
//                  // 从左到右
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //内
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: new Row(
                            // 对齐方式
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("震级：",style: TextStyle(color:Colors.orange,fontWeight: FontWeight.normal, fontSize: 15.0)),
                                Text(earthQuakeInfo.degree.toString()),
                              ]
                          ),
                        ),
                      ),
                      //内嵌布局
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Row(
                            // 对齐方式
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // 从左到右
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("深度：",style: TextStyle(color:Colors.green, fontWeight: FontWeight.normal, fontSize: 15.0)),
                                Text(earthQuakeInfo.depths.toString()),

                              ]
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Row(
                            // 对齐方式
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // 从左到右
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("发生时间:"+earthQuakeInfo.happenTime,style:TextStyle(color: Colors.grey,fontSize: 13 )),

                              ]
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Row(
                            // 对齐方式
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // 从左到右
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("发生地点:"+earthQuakeInfo.happenPlace,style:TextStyle(color: Colors.grey,fontSize: 13 )),

                              ]
                          ),
                        ),
                      ),
//                      Text("发生地点:"+earthQuakeInfo.happenPlace,style:TextStyle(color: Colors.grey,fontSize: 13 )),
                     // Text("发生时间:"+earthQuakeInfo.happenTime,style:TextStyle(color: Colors.grey,fontSize: 13 )),
                    ]
                )
            ),
          ),
          // 向右到箭头
          Expanded(
            //设置弹性系数
            flex: 1,
            child: Container(
//              color: Colors.green,
              width:10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Icon(Icons.navigate_next)
                ],
              ),
            ),
             // child: new Icon(Icons.navigate_next)
          ),
        ],
      ),
    );

    return GestureDetector(
      onTap: () {
        //监听点击事件
        print("click item index=$position");
        //跳转到详情页面
        doNavigator();
      },
      child: new Card(
        child: row,
      ),
    );
    return Card(
      child: row,
    );
  }

  //
  void doNavigator() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new SecNextPage();
    }));
  }


  //实现构建方法
  viewBuild() {
    if (earthInfoList.length != 0) {
      return ListView.builder(
          itemCount: earthInfoList.length,
          itemBuilder: (BuildContext context, int position) {
            return buildRows(position);
          });
    } else {
      // 加载菊花
      return CupertinoActivityIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //page bg color
      backgroundColor: Colors.grey,
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