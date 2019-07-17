import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//me
class MeListView extends StatelessWidget {

  Widget initView() {
    var container=Container(
      margin: EdgeInsets.only(top: 5,left:5,right:5,bottom: 5),
      //margin: EdgeInsets.all(5.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
                color: Colors.white,
              child: new Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    // 头像
                    child:new Image.asset("assets/image/head.png",width: 60, height: 60) ,
                  ),
                  Expanded(
                    flex: 4,
                    // 姓名
                    child: new Text("yichuan",style: TextStyle(color: Colors.black87),),
                  ),
                ],
              )
            ),
          ),
          //RWO 2
          Expanded(
            flex: 6,
            child: Container(
              //内边距
              padding: new EdgeInsets.all(10.0),
              color: Colors.white,
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
                                icon:Icon(Icons.border_inner),
                                onPressed: (){
                                  print("评价");
                                },
                              ),
                              new Text("评价"),
                            ],
                          ),
                          new Column(
                            children: <Widget>[
                              //new Icon(Icons.card_travel),
                              new IconButton(
                                icon:Icon(Icons.card_travel),
                                onPressed: (){
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
                                icon:Icon(Icons.card_giftcard),
                                onPressed: (){
                                  print("卡/券");
                                },
                              ),
                              new Text("卡/券"),
                            ],
                          ),
                          new Column(
                            children: <Widget>[

                              new IconButton(
                                icon:Icon(Icons.mail),
                                onPressed: (){
                                  print("消息");
                                },
                              ),
                              new Text("消息"),
                            ],
                          ),
                        ],
                      )
                    ],
              ),
            )
            ,
          ),
        ],

      ),

    );
    return container;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          print("press...");
        },
        child: new Icon(Icons.mail),
        backgroundColor:  Colors.green,
      ),
      appBar: AppBar(
        leading: IconButton(
          //color: Colors.yellow,
          tooltip:'点击设置',
          icon: Icon(Icons.settings),
          onPressed: (){
            print("点击设置...");
          },
        ),
        title: Text("个人中心",style: TextStyle(fontSize: 15)),
        //new Icon(Icons.border_inner),
      ),
      body: initView(),
    );
  }


}