//import 'dart:convert';

import 'package:dropdown_menu/dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:untitled/listview/earth_quake_card_refresh_filter_listview.dart';
import 'package:untitled/model/dto/earth_quake_dto_model.dart';
import 'menu_data.dart';

//自定义一个数据集合
//EarthQuakeInfoDTO dto=null;
///下拉筛选
class DropDownMenu extends StatefulWidget {
  //


  //const DropDownMenu({Key key, this.dto}) : super(key: key);

  ///下拉筛选
  @override
  State<StatefulWidget> createState() {
    return new DropDownMenuState();
  }
}

///下拉筛选
class DropDownMenuState extends State<DropDownMenu>


    with AutomaticKeepAliveClientMixin {
  //
  GlobalKey globalKey;

  EarthQuakeInfoDTO dto;

  //当前当索引
  //int _currentIndex = 0;
  //集合
//  List FOODS = json.decode(FOOD_JSON);

  ///
  @override
  bool get wantKeepAlive => true;

  //header
  DropdownHeader buildDropdownHeader({DropdownMenuHeadTapCallback onTap}) {


    return new DropdownHeader(
      onTap: onTap,
      titles: [TYPES[TYPE_INDEX], ORDERS[ORDER_INDEX],DEGREETYPES[DTYPE_INDEX]],

    );
  }

  DropdownMenu buildDropdownMenu() {
    return new DropdownMenu(maxMenuHeight: kDropdownMenuItemHeight * 10,
        //  activeIndex: activeIndex,
        menus: [
          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownListMenu(
                  selectedIndex: TYPE_INDEX,
                  data: TYPES,
                  itemBuilder: buildCheckItem,
                );
              },
              height: kDropdownMenuItemHeight * TYPES.length),
          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownListMenu(
                  selectedIndex: ORDER_INDEX,
                  data: ORDERS,
                  itemBuilder: buildCheckItem,
                );
              },
              height: kDropdownMenuItemHeight * ORDERS.length),


          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownListMenu(
                  selectedIndex: ORDER_INDEX,
                  data: DEGREETYPES,
                  itemBuilder: buildCheckItem,
                );
              },
              height: kDropdownMenuItemHeight * ORDERS.length),
        ]);
  }

  Widget buildFixHeaderDropdownMenu() {
    return new DefaultDropdownMenuController(
        child: new Column(
      children: <Widget>[
        buildDropdownHeader(),
        new Expanded(
            child: new Stack(
             children: <Widget>[
            //EarthQuakeCardRefreshListView
            new EarthQuakeCardRefreshFilterListView(),
            buildDropdownMenu()
          ],
        )
        )
      ],
    ));
  }

  @override
  void dispose() {
    super.dispose();
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
    return new Scaffold(
//      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        //title: Text("最近48小时地震信息", style: TextStyle(fontSize: 15)),
        title: Text(title, style: TextStyle(fontSize: 15)),
      ),
      body: buildFixHeaderDropdownMenu(),
    );
  }
}
