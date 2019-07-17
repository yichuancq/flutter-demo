//地震消息model

class EarthQuakeInfo{
  //震级
  double degree=0.0;
  //深度
  int depths=0;
  //发生时间
  String happenTime="";
  //发生地点
  String happenPlace="";
  //
  EarthQuakeInfo({
    this.degree,
    this.depths,
    this.happenTime,
    this.happenPlace
  });

  @override
  String toString() {
    return 'EarthQuakeInfo{degree: $degree, depths: $depths, happenTime: $happenTime, happenPlace: $happenPlace}';
  }
}
