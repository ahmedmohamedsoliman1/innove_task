class ClassesDataModel {
  List<ClassesData>? data;

  ClassesDataModel({this.data});

  ClassesDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ClassesData>[];
      json['data'].forEach((v) {
        data!.add(new ClassesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClassesData {
  String? video;
  String? time;
  String? title;
  String? description;

  ClassesData({this.video, this.time, this.title, this.description});

  ClassesData.fromJson(Map<String, dynamic> json) {
    video = json['video'];
    time = json['time'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video'] = this.video;
    data['time'] = this.time;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}