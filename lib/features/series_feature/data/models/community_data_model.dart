class CommunityDataModel {
  List<CommunityData>? data;

  CommunityDataModel({this.data});

  CommunityDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CommunityData>[];
      json['data'].forEach((v) {
        data!.add(new CommunityData.fromJson(v));
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

class CommunityData {
  String? name;
  String? date;
  String? time;
  String? title;
  String? image;

  CommunityData({this.name, this.date, this.time, this.title, this.image});

  CommunityData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    date = json['date'];
    time = json['time'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['date'] = this.date;
    data['time'] = this.time;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}