import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/utils/easy_badgeview.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
//个人中心界面
class MeListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MeListViewState();
  }
}

class MeListViewState extends State<MeListView> {
  /// switch btn
  bool _switchValue = false;

  Widget initView() {
    var container = Container(
      //外边距
//      margin: EdgeInsets.only(top: 80),
      margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),

      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
//              color: Colors.green,
                child: new Row(
              children: <Widget>[
                new Container(
                  //头像距离左边和右边的外边距
                  margin: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: new Image.asset("assets/image/head.png", width: 60, height: 60),
                ),
                new Text("yichuan"),
                //swapPageView(),
                new EasyBadgeView()
                    .setBadgeNo("10+")
                    .setBadgeColor(Colors.green)
                    .buildBadge(),
//                    new EasyBadgeView().setBadgeNo("10+").setBadgeColor(Colors.red).build(context),
              ],
            )),
          ),

          /// 工具栏
          topTools(),

          /// 图片轮播
          new SizedBox(
            height: 80.0,
            child: swapPageView(),
          ),
          //RWO 2
          Expanded(
            flex: 6,
            child: Container(
//              //内边距
              padding: new EdgeInsets.all(10.0),
              child: _bottomTools(),
            ),
          ),
        ],
      ),
    );
    return container;
  }
  ///bottom Tools
  Widget _bottomTools(){
    return  Column(
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
        new Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("切换主题"),
                leading: new Icon(Icons.swap_horiz),
                trailing: CupertinoSwitch(
                  activeColor: Colors.green,

                  ///自定义颜色
                  value: _switchValue,
                  onChanged: (bool value) {
                    setState(() {
                      ///状态
                      _switchValue = value;
                      // 使用
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    _switchValue = !_switchValue;
                  });
                },
              ),
            ),
            //Divider(height:5.0,indent:0.0,color: Colors.grey)
          ],
        ),

        new Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("设置"),
                leading: new Icon(Icons.settings),
                trailing: new Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  final snackBar = SnackBar(
                    content: Text('设置'),
                    duration: Duration(milliseconds: 500),
                    backgroundColor: Colors.green,
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            //Divider(height:5.0,indent:0.0,color: Colors.grey)
          ],
        ),
        new Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("关注"),
                leading: new Icon(Icons.show_chart),
                trailing: new Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  final snackBar = SnackBar(
                    content: Text('关注'),
                    duration: Duration(milliseconds: 500),
                    backgroundColor: Colors.green,
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
          ],
        ),
        //我的关注，收藏，退出
        new Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("about"),
                leading: new Icon(Icons.info),
                trailing: new Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  final snackBar = SnackBar(
                    content: Text('about'),
                    duration: Duration(milliseconds: 500),
                    backgroundColor: Colors.green,
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
          ],
        ),
        new Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("退出"),
                leading: new Icon(Icons.directions_walk),
                trailing: new Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  exitSystemIos();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  ///顶部工具栏
  Widget topTools() {
    return new Row(
      //关键地方 均匀布局
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new IconButton(
              icon: Icon(Icons.border_inner),
              onPressed: () {
                print("讨论");
              },
            ),
            new Text("讨论"),
          ],
        ),
        new Column(
          children: <Widget>[
            new IconButton(
              icon: Icon(Icons.card_travel),
              onPressed: () {
                print("收藏");
              },
            ),
            new Text("收藏"),
          ],
        ),
        new Column(
          children: <Widget>[
            new IconButton(
              icon: Icon(Icons.card_giftcard),
              onPressed: () {
                print("卡/券");
              },
            ),
            new Text("卡/券"),
          ],
        ),
        new Column(
          children: <Widget>[
            new IconButton(
              icon: Icon(Icons.mail),
              onPressed: () {
                print("消息");
              },
            ),
            new Text("消息"),
          ],
        ),
      ],
    );
  }

  Widget cardView() {
    return new Card(
      color: Colors.green,
      child: new Container(
        //padding: const EdgeInsets.only(left:0,bottom: 10),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.asset("assets/image/notify.png",
                width: 40, height: 40, fit: BoxFit.fill),
          ),
          //on click
          title: new Text("西藏山南市错那县",
              style: TextStyle(color: Colors.white, fontSize: 15)),
          //自定义样式
          subtitle: Text(
            "发震时间:" + "2019-07-19 18:22:09",
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
          //
        ),
      ),
    );
  }

  /// 图片轮播效果部件
  Widget swapPageView() {
    return new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return cardView();
      },
      itemCount: 5,
      //自动翻页
      autoplay: true,
      // 设置宽度
      itemWidth: MediaQuery.of(context).size.width *0.9,
      layout: SwiperLayout.STACK,
      // 分页指示器
      pagination: SwiperPagination(
          alignment: Alignment.bottomCenter, // 位置 Alignment.bottomRight
          margin: const EdgeInsets.fromLTRB(0, 0, 20, 10), // 距离调整
          //圆点滚动
          // 指示器构建
          builder: DotSwiperPaginationBuilder(
            // 字体颜色
            color: Colors.white,
            // 当前的指示字体颜色
            activeColor: Colors.orange,
            // 大小
            size: 5,
            // 当前的指示字体大小
            activeSize: 8,
            space: 1,
          )),
      scale: 0.95,
      // 两张图片之间的间隔
      viewportFraction: 0.8, // 当前视窗展示比例 小于1可见上一个和下一个视窗
    );
  }

// ios风格的对话框
  void exitSystemIos() {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return new CupertinoAlertDialog(
//            title: new Text('退出系统?'),
            content: new Text("退出系统？"),
            actions: <Widget>[
              new CupertinoDialogAction(
                child: new Text('取消'),
                isDefaultAction: true,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new CupertinoDialogAction(
                child: new Text('确定'),
                isDestructiveAction: true,
                onPressed: () {
                  exit(0);
                  //Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  ///
  void infoDialog() {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return new CupertinoAlertDialog(
            content: new Text("info"),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context); //关闭对话框
                  },
                  child: new Text("取消"),
                  textColor: Colors.grey),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("个人中心", style: TextStyle(fontSize: 15)),
      ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            infoDialog();
            print("press...");
          },
          child: new Icon(Icons.mail),
          backgroundColor: Colors.green,
        ),
        body: initView(),
    );
  }
}
