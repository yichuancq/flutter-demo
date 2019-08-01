//地震消息listView
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/model/dto/earth_quake_dto_model.dart';
import 'package:untitled/model/earth_quake_model.dart';
import 'package:untitled/utils/http_service.dart';
import 'earth_quake_listview.dart';

class EarthQuakeCardListView extends StatefulWidget {
  //
  @override
  State<StatefulWidget> createState() {
    //
    return new EarthQuakeCardListViewState();
  }
}

// step2
class EarthQuakeCardListViewState extends State<EarthQuakeCardListView>
    with AutomaticKeepAliveClientMixin {
  //自定义一个数据集合
  List earthInfoList = [];

  @override
  bool get wantKeepAlive => true;

  ///异步加载网络数据
  void loadData() async {
    EarthQuakeInfoDTO dto = await getEarthInfoHttp();
    for (Shuju data in dto.shuju) {
      EarthQuakeInfo quakeInfo = new EarthQuakeInfo();
      quakeInfo.degree = double.parse(data.m);
      quakeInfo.depths = data.ePIDEPTH;
      quakeInfo.happenTime = data.oTIME;
      quakeInfo.happenPlace = data.lOCATIONC;
      //"EPI_LAT": "24.22",
      //"EPI_LON": "122.49",
      //json['latitude'] as double,
      //纬度
      quakeInfo.latitude =
      data.ePILAT == null ? 0.00 : double.parse(data.ePILAT);
      //经度
      quakeInfo.longitude =
      data.ePILON == null ? 0.00 : double.parse(data.ePILON);

      earthInfoList.add(quakeInfo);
    }
    //更新列表
    setState(() {
      //状态
    });
  }

  void loadList() {
    for (int i = 0; i < 20; i++) {
      EarthQuakeInfo quakeInfo = new EarthQuakeInfo();
      quakeInfo.degree = 0.98 + i;
      quakeInfo.depths = 10;
      quakeInfo.happenTime = "2019-08-12 12:23:34";
      quakeInfo.happenPlace = "test";
      earthInfoList.add(quakeInfo);
    }
  }

  @override
  void dispose() {
    earthInfoList.clear();
    super.dispose();
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  //
  //根据强度自定义颜色
  Widget myDegreeText(final double degree) {
    if (degree >= 6.0) {
      return new Text(degree.toStringAsFixed(1),
          style: TextStyle(color: Colors.red, fontSize: 15));
    }
    return new Text(degree.toStringAsFixed(1), style: TextStyle(fontSize: 15));
  }

  buildRows(final int position) {
    EarthQuakeInfo earthQuakeInfo = earthInfoList[position];
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.asset(
              "assets/image/map.png",
              width: 40,
              height: 40,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            //设置弹性系数
            flex: 10,
            child: Container(
                margin: EdgeInsets.only(left: 4.0, right: 4.0),
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
                                Text("震级(M)：",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15.0)),
                                myDegreeText(earthQuakeInfo.degree),
                              ]),
                        ),
                      ),
                      //内嵌布局
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Row(
                              // 从左到右
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("深度(千米)：",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15.0)),
                                Text(earthQuakeInfo.depths.toString()),
                              ]),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Text(
                              "发震时刻(UTC+8):" + earthQuakeInfo.happenTime,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("参考位置:" + earthQuakeInfo.happenPlace,
                            style: TextStyle(color: Colors.grey, fontSize: 13)),
                      ),
                    ])),
          ),
          // 向右到箭头
          new Icon(Icons.navigate_next),
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
  }

  //
  void doNavigator() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new SecNextPage();
    }));
  }

  //实现构建方法
  viewBuild() {
    if (earthInfoList.length == 0) {
      // 加载菊花
      return CupertinoActivityIndicator();
    } else {
      print(earthInfoList.length);
      //
      return ListView.builder(
          //item 的数量
          itemCount: earthInfoList.length,
          itemBuilder: (BuildContext context, int position) {
            return buildRows(position);
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //page bg color
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("最近48小时地震信息", style: TextStyle(fontSize: 15)),
      ),

      body: Center(
        //条目
        child: viewBuild(),
      ),
    );
  }
}
