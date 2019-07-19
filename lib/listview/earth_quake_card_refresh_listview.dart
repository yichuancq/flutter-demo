//地震消息listView
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/model/dto/earth_quake_dto_model.dart';
import 'package:untitled/model/earth_quake_model.dart';
import 'package:untitled/utils/http_service.dart';
import 'earth_quake_listview.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

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
  //自定义一个数据集合
  EarthQuakeInfoDTO dto;
  List earthInfoList = [];
  int currentPage = 0; //第一页
  int pageSize = 10; //页容量
  int totalSize = 0; //总条数
  bool isLoading = false; //是否正在加载数据
  String loadMoreText = "没有更多数据";

  GlobalKey<EasyRefreshState> _easyRefreshKey = new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey = new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();
  @override
  bool get wantKeepAlive => true;
  ///加载更多
  TextStyle loadMoreTextStyle = new TextStyle(color: const Color(0xFF999999), fontSize: 14.0);
  TextStyle titleStyle = new TextStyle(color: const Color(0xFF757575), fontSize: 14.0);

  loadJsonData() async {
    //
    dto = await getEarthInfoPagesHttp(currentPage);
    //total Pages
    totalSize = dto.num;
    print("info " + dto.jieguo);
    print("totalPage :${totalSize}");
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
  }
  //异步加载网络数据
  void loadLessData() async {
    try {
      if (currentPage <= 1) {
        print("page index<=1...");
        print("第一页");
        currentPage = 2;
      }
      this.currentPage--;
      print("currentPage :${currentPage}");
      //var count = (currentPage - 1) * pageSize;
      loadJsonData();
      //更新列表
    } catch (e) {
      print(e.toString());
    }
  }

  //异步加载网络数据
  void loadMoreData() async {
    try {
      print("currentPage :${currentPage}");
      print("totalSize :${totalSize}");
      if (currentPage > totalSize) {
        print("超过总页数...");
        currentPage = totalSize - 1;
      }
      this.currentPage++;
      print("currentPage :${currentPage}");
      // var count = (currentPage - 1) * pageSize;
      loadJsonData();
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
    earthInfoList.clear();
    loadMoreData();
    super.initState();
  }

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

  void doNavigator() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new SecNextPage();
    }));
  }

  initView() {
    return ListView.builder(
        //item 的数量
        itemCount: earthInfoList.length,
        itemBuilder: (BuildContext context, int position) {
          return buildRows(position);
        });
  }

  viewBuild() {
    return new EasyRefresh(
      key: _easyRefreshKey,
      behavior: ScrollOverBehavior(),
      refreshHeader: ClassicsHeader(
        key: _headerKey,
        bgColor: Colors.transparent,
        textColor: Colors.black87,
        moreInfoColor: Colors.black54,
        showMore: true,
      ),
      refreshFooter: ClassicsFooter(
        key: _footerKey,
        bgColor: Colors.transparent,
        textColor: Colors.black87,
        moreInfoColor: Colors.black54,
        showMore: true,
      ),
      child: initView(),
      onRefresh: () async {
        setState(() {
          earthInfoList.clear();
          loadMoreData();
        });
      },
      loadMore: () async {
        setState(() {
          earthInfoList.clear();
          loadLessData();
          //earthInfoList.addAll(addStr);
        });
      },
    );
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