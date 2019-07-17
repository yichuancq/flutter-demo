import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import 'package:untitled/model/dto/earth_quake_dto_model.dart';


// 读取assets文件夹中的earth_info.json 文件
Future<String> loadJsonFile() async {
  //data/json/earth_info.json
  //assets/earth_info.json
  return await rootBundle.loadString('data/json/earth_info.json');
}
Future<EarthQuakeInfoDTO> decodeEarthQuakeInfoDTO() async{
  // 获取本地的 json 字符串
  String jsonString = await loadJsonFile();
  // 解析 json 字符串，返回的是 Map<String, dynamic> 类型
  final jsonMap = json.decode(jsonString);
  // 将 json 字符串解析为 EarthQuakeInfoDTO 对象
  EarthQuakeInfoDTO earthQuakeInfoDTO = EarthQuakeInfoDTO.fromJson(jsonMap);
//  List<Shuju> list=earthQuakeInfoDTO.shuju;
//  for(Shuju shuju in list) {
////    print("" +shuju.toString());
////  }
  return earthQuakeInfoDTO;
}