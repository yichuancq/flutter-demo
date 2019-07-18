// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/model/dto/earth_quake_dto_model.dart';
import 'package:untitled/utils/http_service.dart';

void main() {
  //解析JSON测试
  test("解析JSON测试",() async {

    EarthQuakeInfoDTO earthQuakeInfoDTO= await getEarthInfoHttp();
    print(earthQuakeInfoDTO.num);
    print(earthQuakeInfoDTO.page);
  });
  test('my first unit test', () {
    var answer = 42;
    print(answer);
    expect(answer, 42);
  });
}
