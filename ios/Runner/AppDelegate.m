#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MAMapKit/MAMapKit.h>
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    
    //1、注册高德地图APPKey
    //ed56b40c33ef6855797c64e6c3424129
    [AMapServices sharedServices].apiKey = @"ed56b40c33ef6855797c64e6c3424129";
    
//    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
//    [AMapServices sharedServices].enableHTTPS = YES;
//    
//    ///初始化地图
//    MAMapView *_mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
//
//    ///把地图添加至view
//    [self.addSubview:_mapView];
//
//    ///如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
//    _mapView.showsUserLocation = YES;
//    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
//didFinishLaunchingWithOptions

@end
