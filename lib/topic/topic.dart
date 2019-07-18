import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/model/dto/topic_dto_model.dart';
import 'package:untitled/service/topic_service.dart';

///地震专题
class TopicListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TopicListViewState();
  }
}

class TopicListViewState extends State<TopicListView> {
  ///自定义一个数据集合
  List<Data> topicList = [];

  ///
  @override
  void initState() {
    print("on initState...");
    loadData();
    super.initState();
  }

  void loadData() async {
    //读取json
    TopicDTO dto = await decodeFromDTO();
    topicList = dto.data;
    //更新列表
    setState(() {
      //状态
    });
  }

  //构造item
  Widget buildRow(final int position) {
    Data data = topicList[position];
    ///ListTile布局
    return new ListTile(
      onTap: () {},
      title: Text(data.topicTitle),
      // 自定义样式
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(data.happenTime,
              style: TextStyle(color: Colors.grey, fontSize: 13)),
        ],
      ),
      //
//      trailing: new Column(children: <Widget>[
//        Expanded(
//          child: new Container(child: new Icon(Icons.navigate_next)),
//        ),
//      ]),
    );
    /// 卡片布局
//    return new Card(
//      //color: Colors.grey,
//      margin: EdgeInsets.all(2),
//      child: new Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          new Text(""+data.topicTitle),
//          new Text(""+data.happenTime),
//        ],
//      ),
//    );

  }

  //构造数据
  getRowData(int position) {
    return GestureDetector(
      child: Padding(padding: EdgeInsets.all(5.0), child: buildRow(position)),
    );
  }

  //实现构建方法
  viewBuild() {
    if (topicList.length == 0) {
      //加载菊花
      return CupertinoActivityIndicator();
    }
    return ListView.builder(
        itemCount: topicList.length,
        itemBuilder: (BuildContext context, int position) {
          return getRowData(position);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("地震专题", style: TextStyle(fontSize: 15)),
      ),
      body: viewBuild(),
    );
  }
}
