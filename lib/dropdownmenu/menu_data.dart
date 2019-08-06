const int ORDER_INDEX = 0;

///
const int TYPE_INDEX = 0;

///
const int DTYPE_INDEX = 0;

// 好评优先菜单
const List<Map<String, dynamic>> ORDERS = [
  {"title": "默认"},
  {"title": "震级优先"},
  {"title": "深度优先"},
  {"title": "时间优先"},
];

const List<Map<String, dynamic>> DEGREETYPES = [
  {"title": "全部"},
  {"title": "震级≤6.0"},
  {"title": "震级>6.0"},
];

//类别菜单
const List<Map<String, dynamic>> TYPES = [
  {"title": "全部", "id": 0},
  {"title": "国内", "id": 1},
  {"title": "国外", "id": 2},
];
