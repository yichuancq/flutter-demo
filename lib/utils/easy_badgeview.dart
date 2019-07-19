import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// badgeView
/// 提示小圆点
/// Container
class EasyBadgeView {
  /// 默认宽度
  double _badgeWidth = 20.0;
  double _badgeHigh = 20.0;
  /// icon
  Widget icon;
  /// activeIcon
  Widget activeIcon;
  /// bg color
  Color backgroundColor = Colors.red;
  /// the Badge ,used for unread message ...
  Widget badge;

  /// the Badge number , unread message ...
  String badgeNo = "0";

  ///设置badgeView 提示位置
  EasyBadgeView setBadgeGravity() {
    // todo
    return this;
  }

  //颜色
  EasyBadgeView setBadgeColor(Color color) {
    backgroundColor = color;
    return this;
  }
  /// 设置数字
  EasyBadgeView setBadgeNo(String number) {
    this.badgeNo = number;
    return this;
  }
  ///
  Widget buildBadge() {
    if (this.badgeNo == null || this.badgeNo.isEmpty) {
      return Container();
    }
    if (this.badge != null) {
      return this.badge;
    }
    if (badgeNo != null) {
      /// 动态构造宽度
      _badgeWidth = badgeNo.length.toDouble() + 20;
    }
    return Container(
      width: _badgeWidth,
      height: _badgeHigh,
      padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          ///背景色
          color: this.backgroundColor ?? Colors.red,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      ///expr1 ?? expr2 表示如果expr1非空，则返回其值; 否则返回expr2的值。
      child: new Text(
        this.badgeNo ?? "", style: TextStyle(fontSize: 10, color: Colors.white),
      ),
    );
  }
}
