import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

import 'package:untitled/model/dto/topic_dto_model.dart';

Future<String> loadJsonFile() async {

  return await rootBundle.loadString('assets/json/topic.json');
}
Future<TopicDTO> decodeFromDTO() async {
  String jsonString = await loadJsonFile();
  final jsonMap = json.decode(jsonString);
  TopicDTO topicDTO = TopicDTO.fromJson(jsonMap);

  return topicDTO;
}
