//地震消息listView
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/model/dto/earth_quake_dto_model.dart';
import 'package:untitled/model/earth_quake_model.dart';
import 'package:flutter/material.dart';
import 'package:untitled/service/earth_quake_service.dart';

class EarthQuakeListView extends StatefulWidget {
  //
  @override
  State<StatefulWidget> createState() {
    return new EarthQuakeListViewState();
  }
}

/// step2
class EarthQuakeListViewState extends State<EarthQuakeListView> {
  ///自定义一个数据集合
  List earthInfoList = [];

  @override
  void initState() {
    print("on initState...");
    loadData();
    super.initState();
  }

  //
  void loadData() async {
    print("loadData...");
    EarthQuakeInfoDTO dto = await decodeEarthQuakeInfoDTO();
    for (Shuju data in dto.shuju) {
      EarthQuakeInfo quakeInfo = new EarthQuakeInfo();
      quakeInfo.degree = double.parse(data.m);
      quakeInfo.depths = data.ePIDEPTH;
      quakeInfo.happenTime = data.oTIME;
      quakeInfo.happenPlace = data.lOCATIONC;
      print(data.toString());
      earthInfoList.add(quakeInfo);
    }
    //viewBuild();
  }

  //
  void doNavigator() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new SecNextPage();
    }));
  }

  //构造item
  Widget buildRow(EarthQuakeInfo earthQuakeInfo) {
    //根据强度自定义颜色
    Widget myDegreeText(final double degree) {
      if (degree >= 6.0) {
        //double -> String
        return new Text("震级(M):" + degree.toStringAsFixed(1),
            style: TextStyle(color: Colors.red, fontSize: 15));
      }
      return new Text("震级(M):" + degree.toStringAsFixed(1),
          style: TextStyle(color: Colors.green, fontSize: 15));
    }

    return new ListTile(
      leading: ClipRRect(
        // borderRadius: BorderRadius.circular(40.0),
        borderRadius: BorderRadius.circular(4.0),
        child: Image.asset("assets/head1.png",
            width: 50, height: 50, fit: BoxFit.fill),
      ),
      //on click
      onTap: () {
        //跳转
        doNavigator();
      },

      title: myDegreeText(earthQuakeInfo.degree),
      // 自定义样式
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("深度(KM):" + earthQuakeInfo.depths.toString(),
              style: TextStyle(color: Colors.black87, fontSize: 13.0)),
          Text("参考地点:" + earthQuakeInfo.happenPlace,
              style: TextStyle(color: Colors.grey, fontSize: 13)),
          Text("发生时间:" + earthQuakeInfo.happenTime,
              style: TextStyle(color: Colors.grey, fontSize: 13))
        ],
      ),
      //
      trailing: new Column(children: <Widget>[
        Expanded(
          child: new Container(child: new Icon(Icons.navigate_next)),
        ),
      ]),
    );
  }

  //构造数据
  getRowData(int position) {
    EarthQuakeInfo quakeInfo = earthInfoList[position];
    return GestureDetector(
      child: Padding(padding: EdgeInsets.all(5.0), child: buildRow(quakeInfo)),
    );
  }

  //实现构建方法
  viewBuild() {
    if (earthInfoList.length != 0) {
      return ListView.builder(
          itemCount: earthInfoList.length,
          itemBuilder: (BuildContext context, int position) {
            return getRowData(position);
          });
    } else {
      //加载菊花
      return new Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //加载菊花
            new CupertinoActivityIndicator()
          ],
          // new CupertinoActivityIndicator()
        ),
      );
    }
  }

  // 实现构建方法
  @override
  Widget build(BuildContext context) {
    //loadData();
    return Scaffold(
      appBar: AppBar(
        title: Text("地震消息显示", style: TextStyle(fontSize: 15)),
      ),
      body: viewBuild(),
    );
  }
}

// 实现已保存数据的页面
class SecNextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: Text("详情查看", style: TextStyle(fontSize: 15)),
      ),
    );
  }
}
