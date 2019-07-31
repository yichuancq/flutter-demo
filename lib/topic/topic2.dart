import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:untitled/model/dto/topic_dto_model.dart';
import 'package:untitled/service/topic_service.dart';

const APPBAR_SCROLL_OFFSET = 100;

///地震专题
class TopicListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TopicListViewState();
  }
}

class TopicListViewState extends State<TopicListView> {
  ///
  double appBarAlpha = 0;

  ///自定义一个数据集合
  List<Data> topicList = [];

  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();

  void _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
//    print(appBarAlpha);
  }

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
      trailing: new Column(children: <Widget>[
        Expanded(
          child: new Container(child: new Icon(Icons.navigate_next)),
        ),
      ]),
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

  viewBuilder2() {
    return Stack(
      children: <Widget>[
        MediaQuery.removePadding(
          //移除ListView得padding
          removeTop: true, //移除Top
          context: context,
          child: NotificationListener(
            ///实现对列表得监听  --  接收 onNotification 得回调，每次滚动得时候都会回调这个函数
            onNotification: (scrollNotification) {
              ///1、只监测ListView的滚动（深度设为0），2、监测滚动的时候（ScrollUpdateNotification）
              if (scrollNotification is ScrollUpdateNotification &&
                  scrollNotification.depth == 0) {
                _onScroll(scrollNotification.metrics.pixels);
                setState(() {});
              }
            },
            child: Center(
              child: new EasyRefresh(
                key: _easyRefreshKey,
                refreshHeader: BezierCircleHeader(
                  key: _headerKey,
                  backgroundColor: Colors.white,
                  color: Colors.green,
                ),
                child: new ListView.builder(
                    //ListView的Item
                    itemCount: topicList.length,
                    itemBuilder: (BuildContext context, int position) {
                      return getRowData(position);
                    }),
                onRefresh: () async {
                  await new Future.delayed(const Duration(seconds: 1), () {});
                },
              ),
            ),
          ),
        ),
        Opacity(
          //改变透明度都可以使用 Opacity 将其包裹
          opacity: appBarAlpha,
          child: Container(
            height: 60.0,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 0.0),
                child: Text("地震专题", style: TextStyle(color: Colors.green, fontSize: 15)),
//                child: AppBar(
//                  backgroundColor: Colors.white,
//                  title: Text("地震专题",
//                      style: TextStyle(color: Colors.white, fontSize: 15)),
//                  actions: <Widget>[
//                    IconButton(
//                        icon: Icon(Icons.search),
//                        tooltip: 'Restitch it',
//                        onPressed: () {}),
//                  ],
//                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  //实现构建方法
  viewBuild() {
    return Center(
      child: new EasyRefresh(
        key: _easyRefreshKey,
        refreshHeader: BezierCircleHeader(
          key: _headerKey,
          backgroundColor: Colors.white,
          color: Colors.green,
        ),
        child: new ListView.builder(
            //ListView的Item
            itemCount: topicList.length,
            itemBuilder: (BuildContext context, int position) {
              return getRowData(position);
            }),
        onRefresh: () async {
          await new Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              //topicList.clear();
              //topicList.addAll(topicList);
            });
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.white,
        child: new SafeArea(
          child: Scaffold(
//            backgroundColor: Colors.grey,
            body: viewBuilder2(),
          ),
        ));
  }
}
