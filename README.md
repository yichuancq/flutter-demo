# flutter 地震数据展示小案例学习
- 项目只供学习参考非商业用途 
- developer: yichuan  email:1012027293@qq.com
- 本项目目前已经支持打包发布apk,且能在真机运行


A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## flutter 展示地震数据UI效果

- URL：https://github.com/yichuancq/flutter-demo/blob/master/screenshot

- 地震消息UI

<img src="https://github.com/yichuancq/flutter-demo/blob/master/screenshot/message.png" width="40%" height="40%">


- 专题界面UI

<img src="https://github.com/yichuancq/flutter-demo/blob/master/screenshot/topic.png" width="40%" height="40%">


- 个人中心UI

<img src="https://github.com/yichuancq/flutter-demo/blob/master/screenshot/mine.png" width="40%" height="40%">

## 添加第三方插件
- 官网插件english_words

  english_words: ^3.1.0
  
- #####瀑布流插件

  flutter_staggered_grid_view: ^0.2.7
  
- #####本地存储插件

  shared_preferences: ^0.5.2
  
- #####网络缓存图片

  cached_network_image: ^1.1.0
  
- #####屏幕尺寸工具插件

  flutter_screenutil: ^0.5.3
  
- #####dio
  dio: ^2.1.2
  
- #####图片轮播

  flutter_swiper: ^1.0.6
- #####下拉刷新
  
   flutter_easyrefresh: ^1.2.7
- #####小图标控件
 
  cupertino_icons: ^0.1.2
  
  
## 打包生成apk
yichuandeMacBook-Pro:flutter-demo yichuan$ /Users/yichuan/Documents/flutter/bin/flutter build apk

You are building a fat APK that includes binaries for android-arm, android-arm64.

If you are deploying the app to the Play Store, it's recommended to use app bundles or split the APK to reduce the APK size.

    To generate an app bundle, run:
        flutter build appbundle --target-platform android-arm,android-arm64
        Learn more on: https://developer.android.com/guide/app-bundle
        
    To split the APKs per ABI, run:
        flutter build apk --target-platform android-arm,android-arm64 --split-per-abi
        Learn more on:  https://developer.android.com/studio/build/configure-apk-splits#configure-abi-split
        
Initializing gradle...                                              0.8s

Resolving dependencies...                                           1.4s

Running Gradle task 'assembleRelease'...   
                             
Running Gradle task 'assembleRelease'... Done                      68.6s

Built build/app/outputs/apk/release/app-release.apk (11.4MB).

yichuandeMacBook-Pro:flutter-demo yichuan$ 

