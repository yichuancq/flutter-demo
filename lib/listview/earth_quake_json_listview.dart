//地震消息listView
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:untitled/model/dto/earth_quake_dto_model.dart';
import 'package:untitled/model/earth_quake_model.dart';
import 'package:flutter/material.dart';

class EarthQuakeCardListView extends StatefulWidget {
  //
  @override
  State<StatefulWidget> createState() {
    //
    return new EarthQuakeCardListViewState();
  }
}

// step2
class EarthQuakeCardListViewState extends State<EarthQuakeCardListView> {
  //自定义一个数据集合
  List earthInfoList = [];

  @override
  void initState() {
    print("on initState...");
    for (int i = 0; i < 20; i++) {
      EarthQuakeInfo quakeInfo = new EarthQuakeInfo();
      quakeInfo.degree = 0.98 + i;
      quakeInfo.depths = 10;
      quakeInfo.happenTime = "2019-08-12 12:23:34";
      quakeInfo.happenPlace = "test";
      earthInfoList.add(quakeInfo);
    }
    super.initState();
  }

  //
  buildRows(EarthQuakeInfo earthQuakeInfo) {
    var row = Container(
      margin: EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            // borderRadius: BorderRadius.circular(40.0),
            borderRadius: BorderRadius.circular(4.0),
            child: Image.asset(
              "assets/head1.png",
              width: 80,
              height: 80,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 10.0),
//            width: 200,
                height: 80.0,
                child: Column(
//                  // 从左到右
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //内
                      Expanded(
                        child: Container(
                          child: new Row(
                              // 对齐方式
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("震级：",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15.0)),
                                Text(earthQuakeInfo.degree.toString()),
                              ]),
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
                                Text("深度：",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15.0)),
                                Text(earthQuakeInfo.depths.toString()),
                              ]),
                        ),
                      ),

                      Text("发生地点:" + earthQuakeInfo.happenPlace,
                          style: TextStyle(color: Colors.grey, fontSize: 13)),
                      Text("发生时间:" + earthQuakeInfo.happenTime,
                          style: TextStyle(color: Colors.grey, fontSize: 13)),
                    ])),
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
    EarthQuakeInfoDTO _earthQuakeInfoDTO;
    return new FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("data/json/earth_info.json"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final jsonMap = json.decode(snapshot.data.toString());
          //将json 字符串解析为 EarthQuakeInfoDTO 对象
          _earthQuakeInfoDTO = EarthQuakeInfoDTO.fromJson(jsonMap);
          return new ListView.builder(
            padding: EdgeInsets.all(1.0),
            itemCount: _earthQuakeInfoDTO.shuju.length,
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                //color: Colors.grey,
                margin: EdgeInsets.all(3),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //new Text(earthQuakeInfoDTO.num.toString()),
                    new Text(_earthQuakeInfoDTO.shuju[index].m),
                    new Text(
                        _earthQuakeInfoDTO.shuju[index].ePIDEPTH.toString()),
                    new Text(_earthQuakeInfoDTO.shuju[index].lOCATIONC),
                    // new Text("Height: ${data[index]["height"]}"),
                    //new Text("Gender: ${data[index]["gender"]}"),
                  ],
                ),
              );
            },
          );
        }
        return new CircularProgressIndicator();
      },
    );
  }
}
