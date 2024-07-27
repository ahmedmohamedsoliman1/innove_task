class SeriesDataModel {
  String? id;
  String? image;
  String? title ;
  String? name;
  String? description;
  String? video;
  String? work ;
  String? workDesc ;

  SeriesDataModel(
      {this.id, this.image, this.name, this.description, this.video , this.title ,
      this.work , this.workDesc});

  SeriesDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    video = json['video'];
    title = json["title"];
    work = json["work"];
    workDesc = json["work_desc"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    data['video'] = this.video;
    data["title"] = this..title ;
    data["work"] = this.work ;
    data["work_desc"] = this.workDesc ;
    return data;
  }
}