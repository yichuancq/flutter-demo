//地震消息listView
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:untitled/map/gaode_map.dart';
import 'package:untitled/model/dto/earth_quake_dto_model.dart';
import 'package:untitled/model/earth_quake_model.dart';
import 'package:untitled/utils/http_service.dart';

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

  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  @override
  bool get wantKeepAlive => true;

  ///加载更多
  TextStyle loadMoreTextStyle =
      new TextStyle(color: const Color(0xFF999999), fontSize: 14.0);
  TextStyle titleStyle =
      new TextStyle(color: const Color(0xFF757575), fontSize: 14.0);

  loadJsonData() async {
    //
    dto = await getEarthInfoPagesHttp(currentPage,4);
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
        doNavigator(earthQuakeInfo);
      },
      child: new Card(
        child: row,
      ),
    );
  }

  void doNavigator(EarthQuakeInfo earthQuakeInfo) {
    print("选择：" + earthQuakeInfo.toString());
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return MapPage(earthQuakeInfo: earthQuakeInfo);
      // return SecNextPage();
    }));
  }

  ///
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
      // 修改样式头部
      refreshHeader: BezierCircleHeader(
        key: _headerKey,
        backgroundColor: Colors.white,
        color: Colors.green,
      ),
      // 修改尾部样式
      refreshFooter: BezierBounceFooter(
        key: _footerKey,
        backgroundColor: Colors.white,
        color: Colors.green,
      ),
      child: initView(),
      onRefresh: () async {
        await new Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            earthInfoList.clear();
            loadMoreData();
          });
        });
      },
      loadMore: () async {
        await new Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            earthInfoList.clear();
            loadLessData();
            //earthInfoList.addAll(addStr);
          });
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
        centerTitle: true,
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
