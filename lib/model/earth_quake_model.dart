//地震消息model

import 'package:amap_base/amap_base.dart';

class EarthQuakeInfo {
  //震级
  double degree = 0.0;

  //深度
  int depths = 0;

  //发生时间
  String happenTime = "";

  //发生地点
  String happenPlace = "";

  //纬度
  double latitude;

  //经度
  double longitude;

  //
  EarthQuakeInfo(
      {this.degree,
      this.depths,
      this.happenTime,
      this.happenPlace,
      this.latitude,
      this.longitude});

  @override
  String toString() {
    return 'EarthQuakeInfo{degree: $degree, depths: $depths, happenTime: '
        '$happenTime, happenPlace: $happenPlace ,'
        ' 纬度: $latitude, 经度:$longitude }';
  }
}
