import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:untitled/model/dto/earth_quake_dto_model.dart';
Future<void> doGet() async {}
//网络请求

/// 获取网络数据
Future<EarthQuakeInfoDTO> getEarthInfoHttp() async {
  try {
    //http://www.ceic.ac.cn/ajax/search?page=1&&start=2019-07-15&&end=2019-07-15&&jingdu1=&&jingdu2=&&weidu1=&&weidu2=&&height1=&&height2=&&zhenji1=&&zhenji2=&&callback=
    final String url = "http://www.ceic.ac.cn/ajax/speedsearch?num=2&&page=1&&callback=jQuery18009440560787813581_1563467313956&_=1563467336898";
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      String result=response.data.toString();
      String  fixString="Query18009440560787813581_1563467313956(";
      String subString=result.substring(fixString.length+1,result.length-1);
      final jsonMap = json.decode(subString);
      return EarthQuakeInfoDTO.fromJson(jsonMap);
    }
  } catch (e) {
    print(e);
  }
}

/// 获取网络数据
Future<EarthQuakeInfoDTO> getEarthInfoPagesHttp(int page) async {
  try {
    //http://www.ceic.ac.cn/ajax/search?page=1&&start=2019-07-15&&end=2019-07-15&&jingdu1=&&jingdu2=&&weidu1=&&weidu2=&&height1=&&height2=&&zhenji1=&&zhenji2=&&callback=
    //http://www.ceic.ac.cn/ajax/speedsearch?num=3&&page=1&&callback=jQuery18004632403418509128_1563550548942&_=1563551136430
    //http://www.ceic.ac.cn/ajax/speedsearch?num=4&&page=1&&callback=jQuery18004632403418509128_1563550548942&_=1563553564961
    final String url = "http://www.ceic.ac.cn/ajax/speedsearch?num=4&&page="+page.toString()+"&&callback=jQuery18004632403418509128_1563550548942&_=1563553564961";

//    final String url = "http://www.ceic.ac.cn/ajax/speedsearch?num=3&&page="+page.toString()+"&&callback=jQuery18009440560787813581_1563467313956&_=1563467336898";
    //final String url = "http://www.ceic.ac.cn/ajax/speedsearch?num=2&&page="+page.toString()+"&&callback=jQuery18009440560787813581_1563467313956&_=1563467336898";
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      print("response.statusCode:${response.statusCode}");
      String result=response.data.toString();
      String  fixString="Query18009440560787813581_1563467313956(";
      String subString=result.substring(fixString.length+1,result.length-1);
      final jsonMap = json.decode(subString);
      return EarthQuakeInfoDTO.fromJson(jsonMap);
    }
  } catch (e) {
    print(e);
  }
}

