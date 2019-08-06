///
const int ORDER_INDEX = 0;
/// 默认选中的索引
const int TYPE_INDEX = 0;
///
const int DGTYPE_INDEX = 0;
//类别菜单
const List<Map<String, dynamic>> TYPES = [
  //按时间：
  // 最近24小时内地震
  // 最近48小时内地震
  // 最近7天内地震
  // 最近30天内地震
  // 最近一年内地震
  {"title": "最近24小时内", "id": 0},
  {"title": "最近48小时内", "id": 1},
  {"title": "最近7天内", "id": 2},
  {"title": "最近30天内", "id": 3},
  {"title": "最近一年内", "id": 4},
];

// 好评优先菜单
const List<Map<String, dynamic>> ORDERS = [
  //
  {"title": "默认","id": 0},
  {"title": "震级优先","id": 1},
  {"title": "深度优先","id": 2},
  {"title": "时间优先","id": 3},
];
const List<Map<String, dynamic>> DEGREETYPES = [
  //按震级（一年内）：6.0级以上
  {"title": "全部","id":4},
  {"title": "6.0级以上地震","id": 10},
  {"title": "5.0级以上地震","id": 9},
  {"title": "4.0级以上地震","id": 8},
  {"title": "3.0级以上地震","id": 5},
  {"title": "3.0级以下地震","id": 7},
];
