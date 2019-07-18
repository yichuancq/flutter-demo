import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
      //margin: EdgeInsets.all(5.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
//                color: Colors.white,
                child: new Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  // 头像
                  child: new Image.asset("assets/image/head.png",
                      width: 60, height: 60),
                ),
                Expanded(
                  flex: 2,
                  // 姓名
                  child: new Text("yichuan"),
                ),
              ],
            )),
          ),
          //RWO 2
          Expanded(
            flex: 6,
            child: Container(
              //内边距
              padding: new EdgeInsets.all(10.0),
//              color: Colors.white,
              child: Column(
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  new Row(
                    //关键地方 均匀布局
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Column>[
                      new Column(
                        children: <Widget>[
                          //new Icon(Icons.border_inner),
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
                          //new Icon(Icons.card_travel),
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
                          //new Icon(Icons.card_giftcard),
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
                  ),

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
              ),
            ),
          ),
        ],
      ),
    );
    return container;
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
//            title: new Text('退出系统?'),
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
    return Scaffold(
//      backgroundColor: Colors.grey,
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          infoDialog();
          print("press...");
        },
        child: new Icon(Icons.mail),
        backgroundColor: Colors.green,
      ),
      appBar: AppBar(
//        leading: IconButton(
//          //color: Colors.yellow,
//          tooltip:'点击设置',
//          icon: Icon(Icons.settings),
//          onPressed: (){
//            print("点击设置...");
//          },
//        ),
        title: Text("个人中心", style: TextStyle(fontSize: 15)),
        //new Icon(Icons.border_inner),
      ),
      body: initView(),
    );
  }
}
