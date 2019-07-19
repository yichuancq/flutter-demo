//地震消息listView
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/model/dto/earth_quake_dto_model.dart';
import 'package:untitled/model/earth_quake_model.dart';
import 'package:untitled/utils/http_service.dart';
import 'earth_quake_listview.dart';

/// 带刷新功能带列表
class EarthQuakeCardRefreshListView extends StatefulWidget {
  //
  @override
  State<StatefulWidget> createState() {
    //
    return new EarthQuakeCardRefreshListViewState();
  }
}

///
class EarthQuakeCardRefreshListViewState
    extends State<EarthQuakeCardRefreshListView>
    with AutomaticKeepAliveClientMixin {
  EarthQuakeInfoDTO dto;

  //自定义一个数据集合
  List earthInfoList = [];
  int currentPage = 0; //第一页
  int pageSize = 10; //页容量
  int totalSize = 0; //总条数
  String loadMoreText = "没有更多数据";

  //初始化滚动监听器，加载更多使用
  ScrollController _scrollController = new ScrollController();

  @override
  bool get wantKeepAlive => true;

  ///加载更多
  TextStyle loadMoreTextStyle =
      new TextStyle(color: const Color(0xFF999999), fontSize: 14.0);
  TextStyle titleStyle =
      new TextStyle(color: const Color(0xFF757575), fontSize: 14.0);

  //异步加载网络数据
  void loadMoreData() async {
    try {
      ///
      this.currentPage++;
      print("currentPage :${currentPage}");
      var count = (currentPage - 1) * pageSize;
      //
      dto = await getEarthInfoPagesHttp(currentPage);
      //total Pages
      totalSize = dto.num;
      print("info " + dto.jieguo);
      print("totalPage :${totalSize}");
      if (currentPage > totalSize) {
        print("超过总页数...");
        currentPage = 0;
        return;
      }
      for (Shuju data in dto.shuju) {
        EarthQuakeInfo quakeInfo = new EarthQuakeInfo();
        quakeInfo.degree = double.parse(data.m);
        quakeInfo.depths = data.ePIDEPTH;
        quakeInfo.happenTime = data.oTIME;
        quakeInfo.happenPlace = data.lOCATIONC;
        earthInfoList.add(quakeInfo);
      }
      //更新列表
      setState(() {
        //状态
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    earthInfoList.clear();
    super.dispose();
  }

  @override
  void initState() {
    //加载第一页数据
    loadMoreData();
//    doListener();
    super.initState();
  }

  //
  //根据强度自定义颜色
  Widget myDegreeText(final double degree) {
    if (degree >= 6.0) {
      //double -> String
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

  ///加载更多进度条
  Widget _buildProgressMoreIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(15.0),
      child: new Center(
        child: new Text(loadMoreText, style: loadMoreTextStyle),
      ),
    );
  }

  //
  void doNavigator() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new SecNextPage();
    }));
  }

  ///下拉刷新,必须异步async不然会报错
  Future _pullToRefresh() async {
    // currentPage = 0;
    earthInfoList.clear();
    loadMoreData();
    return null;
  }

  //实现构建方法
  viewBuild() {
    if (earthInfoList.length == 0) {
      /// 加载菊花
      //CircularProgressIndicator
//      return new Center(child: new CircularProgressIndicator());
      return new Center(child: new CupertinoActivityIndicator());
    } else {
      print(earthInfoList.length);
      //
      return new RefreshIndicator(
          //
          onRefresh: _pullToRefresh,
          color: Colors.green,
          //下拉刷新
          child: ListView.builder(
              itemCount: earthInfoList.length,
              //itemCount: earthInfoList.length + 1,
              itemBuilder: (BuildContext context, int position) {
                if (position == earthInfoList.length) {
                  return _buildProgressMoreIndicator();
                }
                return buildRows(position);
              },

              ///指明控制器加载更多使用
              controller: _scrollController));
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = "地震信息";
    //更新列表
    setState(() {
      //状态
      if (dto != null && dto.jieguo != null) {
        title = dto.jieguo;
      }
    });
    return Scaffold(
      //page bg color
      backgroundColor: Colors.grey,
      appBar: AppBar(
        //title: Text("最近48小时地震信息", style: TextStyle(fontSize: 15)),
        title: Text(title, style: TextStyle(fontSize: 15)),
      ),
      body: Center(
        //条目
        child: viewBuild(),
      ),
    );
  }
}
//   void doListener () {
//    //固定写法，初始化滚动监听器，加载更多使用
//    _scrollController.addListener(() {
//      var maxScroll = _scrollController.position.maxScrollExtent;
//      var pixel = _scrollController.position.pixels;
//      if (maxScroll == pixel && earthInfoList.length < totalSize) {
//        setState(() {
//          loadMoreText = "正在加载中...";
//          loadMoreTextStyle =
//              new TextStyle(color: Colors.green, fontSize: 14.0);
//        });
//        loadMoreData();
//      } else {
//        setState(() {
//          loadMoreText = "没有更多数据";
//          loadMoreTextStyle = new TextStyle(color: Colors.grey, fontSize: 14.0);
//        });
//      }
//    });
//  }
