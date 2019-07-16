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
  void doNavigator() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new SecNextPage();
    }));
  }
  //构造item
  Widget buildRow(EarthQuakeInfo earthQuakeInfo) {
    return new ListTile(
      leading:
        ClipRRect(
        // borderRadius: BorderRadius.circular(40.0),
         borderRadius: BorderRadius.circular(4.0),
        child:
          Image.asset("assets/head1.png",width: 50, height: 50, fit: BoxFit.fill
        ),
      ),
      //on click
      onTap: (){
        //跳转
        doNavigator();
      },
      title: new Text("地震强度:"+ earthQuakeInfo.degree.toString(), style: TextStyle(color: Colors.green,fontSize: 15 )),
      subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Text("震级:"+earthQuakeInfo.depths.toString(),style: TextStyle(color:Colors.orange, fontSize: 15.0)),
             Text("发生地点:"+earthQuakeInfo.happenPlace,style:TextStyle(color: Colors.grey,fontSize: 13 )),
             Text("发生时间:" +earthQuakeInfo.happenTime, style:TextStyle(color: Colors.grey,fontSize: 13))
           ],
        ),
      //
     trailing: new Column(
        children: <Widget>[
          Expanded(
            child: new Container(
              child: new Icon(Icons.navigate_next)
            ),
      ),
      ]),
    );

  }
  //构造数据
  getRowData(int position) {
    EarthQuakeInfo quakeInfo=earthInfoList[position];
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(5.0),
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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: Text("详情查看",style: TextStyle(fontSize: 15)),
      ),
    );
  }
}
