import 'package:amap_base/amap_base.dart';
import 'package:flutter/material.dart';
import 'package:untitled/model/earth_quake_model.dart';

///
EarthQuakeInfo globalInfo;

class MapPage extends StatefulWidget {
  MapPage({Key key, this.earthQuakeInfo}) : super(key: key);

  final EarthQuakeInfo earthQuakeInfo;

  @override
  _MapPageState createState() {
    globalInfo = earthQuakeInfo;
    return new _MapPageState();
  }
}

class _MapPageState<EarthQuakeInfo> extends State<MapPage> {
  AMapController _controller;

  EarthQuakeInfo earthQuakeInfo;

  @override
  Widget build(BuildContext context) {
    // LatLng(this.latitude, this.longitude);
    return Scaffold(
        appBar: AppBar(
          title: Text("高德地图定位"),
        ),
        body: AMapView(
          onAMapViewCreated: (controller) {
            _controller = controller;
          },
          amapOptions: AMapOptions(
            compassEnabled: false,
            zoomControlsEnabled: true,
            logoPosition: LOGO_POSITION_BOTTOM_CENTER,
//            camera: CameraPosition(target: LatLng(0.00, 0.00), zoom: 4),
            camera: CameraPosition(
                target: LatLng(globalInfo.latitude, globalInfo.longitude),
                zoom: 8,),
          ),
        ));
  }
}
