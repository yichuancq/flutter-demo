import 'package:amap_base/amap_base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/model/earth_quake_model.dart';

EarthQuakeInfo globalInfo;

///地图页面
class MapPage extends StatefulWidget {
  final EarthQuakeInfo earthQuakeInfo;
  MapPage({Key key, this.earthQuakeInfo}) : super(key: key);

  @override
  _MapPageState createState() {
    globalInfo = earthQuakeInfo;
    return new _MapPageState();
  }
}

///
class _MapPageState<EarthQuakeInfo> extends State<MapPage>
    with AutomaticKeepAliveClientMixin {
  AMapController _controller;

  EarthQuakeInfo earthQuakeInfo;

  /// 添加覆盖物
  Widget _addMark() {
    ///// Marker覆盖物的位置坐标 [Android, iOS]
    _controller.addMarker(new MarkerOptions(
      highlighted: true,
      enabled: false,
      //Marker覆盖物是否平贴地图
      isFlat: false,
      //Marker覆盖物的坐标是否是Gps
      isGps: true,
      position: LatLng(globalInfo.latitude, globalInfo.longitude),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller = null;
  }

  Widget _viewBuild() {
    return _mapView();
  }

  ///mapView
  Widget _mapView() {
    return AMapView(
      onAMapViewCreated: (controller) {
        _controller = controller;
        //添加覆盖物
        _addMark();
      },
      amapOptions: AMapOptions(
        scaleControlsEnabled: true,
        rotateGesturesEnabled: true,
        zoomControlsEnabled: true,
        //是否启动显示定位蓝点, 默认false
        myLocationEnabled: true,
        compassEnabled: true,
        logoPosition: LOGO_POSITION_BOTTOM_CENTER,
        camera: CameraPosition(
          target: LatLng(globalInfo.latitude, globalInfo.longitude),
          zoom: 5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String title = "高德地图定位";
    //更新
    setState(() {
      //状态
      if (globalInfo != null && globalInfo.happenPlace != null) {
        title = globalInfo.happenPlace;
      }
    });
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title, style: TextStyle(fontSize: 15)),
        ),
        body: _viewBuild());
  }

  @override
  bool get wantKeepAlive => true;
}
