//import 'dart:convert';
import 'package:dropdown_menu/dropdown_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/listview/earth_quake_card_refresh_filter_listview.dart';
import 'package:untitled/model/dto/earth_quake_dto_model.dart';
import 'package:untitled/tabbar/bottom_navigation_bar.dart';

import 'menu_data.dart';

///下拉筛选
///
dynamic subData;
var parentMenuId = 0;

class DropDownMenu extends StatefulWidget {
  ///下拉筛选
  @override
  State<StatefulWidget> createState() {
    return new DropDownMenuState();
  }
}

///下拉筛选
class DropDownMenuState extends State<DropDownMenu>
    with AutomaticKeepAliveClientMixin {
//  dynamic subData;
//  var parentMenuId =0;

  GlobalKey globalKey;

  EarthQuakeInfoDTO dto;

  ///
  @override
  bool get wantKeepAlive => true;

  //header
  DropdownHeader buildDropdownHeader({DropdownMenuHeadTapCallback onTap}) {
    return new DropdownHeader(
      onTap: onTap,
      titles: [
        TYPES[TYPE_INDEX],
        ORDERS[ORDER_INDEX],
        DEGREETYPES[DGTYPE_INDEX]
      ],
    );
  }
////
//  @override
//  void initState() {
//    //加载第一页数据
////    new DropDownMenu();
////    super.initState();
//
//    print("_parentMenuId1=$parentMenuId");
//    print("_subData1=$subData");
//
//  }

  //
  DropdownMenu buildDropdownMenu() {
    return new DropdownMenu(
        maxMenuHeight: kDropdownMenuItemHeight * 10,
        menus: [
          //menu1
          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownListMenu(
                  selectedIndex: TYPE_INDEX,
                  data: TYPES,
                  itemBuilder: buildCheckItem,
                );
              },
              height: kDropdownMenuItemHeight * TYPES.length),
          //menu2
          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownListMenu(
                  selectedIndex: ORDER_INDEX,
                  data: ORDERS,
                  itemBuilder: buildCheckItem,
                );
              },
              height: kDropdownMenuItemHeight * ORDERS.length),

          //menu3
          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownListMenu(
                  selectedIndex: DGTYPE_INDEX,
                  data: DEGREETYPES,
                  itemBuilder: buildCheckItem,
                );
              },
              height: kDropdownMenuItemHeight * ORDERS.length),
        ]);
  }
//
  Widget myController() {

//    print("myController=$parentMenuId");
//    print("myController ="+subData);

    return  new Column(
      children: <Widget>[
        buildDropdownHeader(),
        new Expanded(
            child: new Stack(
              children: <Widget>[
                //EarthQuakeCardRefreshListView
                new EarthQuakeCardRefreshFilterListView(
                    parentMenuId: parentMenuId, data: subData),
                //new EarthQuakeCardRefreshFilterListView(),
                buildDropdownMenu(),
              ],
            )),
      ],
    );
  }

  ///构建菜单
  Widget buildFixHeaderDropdownMenu() {
    return new DefaultDropdownMenuController(
        //选择事件
        onSelected: ({int menuIndex, int index, int subIndex, dynamic data}) {
          setState(() {
            print("menuIndex=$menuIndex");
            print("data=$data");
            parentMenuId = menuIndex;
            subData = data;
            //

          });
          // todo initState
//          this.build(context);
//          initState();
        },
        child: myController(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///
  @override
  Widget build(BuildContext context) {
    String title = "地震信息";
//    dynamic _subData1;
//    int _parentMenuId1 = 0;
    //更新列表
    setState(() {
      print("_parentMenuId1=$parentMenuId");
      print("_subData1=$subData");
//      _parentMenuId1 = parentMenuId;
//      _subData1 = subData;
    });
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //title: Text("最近48小时地震信息", style: TextStyle(fontSize: 15)),
        title: Text(title, style: TextStyle(fontSize: 15)),
      ),
      body: buildFixHeaderDropdownMenu(),
      //body: buildFixHeaderDropdownMenu(_parentMenuId1, _subData1),
    );
  }
}
