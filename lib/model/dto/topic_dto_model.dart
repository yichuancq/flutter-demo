class TopicDTO {
  List<Data> data;

  TopicDTO({this.data});

  TopicDTO.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String happenTime;
  String topicTitle;

  Data({this.happenTime, this.topicTitle});

  Data.fromJson(Map<String, dynamic> json) {
    happenTime = json['happen_time'];
    topicTitle = json['topic_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['happen_time'] = this.happenTime;
    data['topic_title'] = this.topicTitle;
    return data;
  }
}
