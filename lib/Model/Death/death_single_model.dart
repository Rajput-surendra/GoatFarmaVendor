class GetSingleDataModel {
  bool? error;
  String? message;
  SingleDataList? data;

  GetSingleDataModel({this.error, this.message, this.data});

  GetSingleDataModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new SingleDataList.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SingleDataList {
  String? id;
  String? catId;
  String? weight;
  String? age;
  String? breed;

  SingleDataList({this.id, this.catId, this.weight, this.age, this.breed});

  SingleDataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catId = json['cat_id'];
    weight = json['weight'];
    age = json['age'];
    breed = json['breed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cat_id'] = this.catId;
    data['weight'] = this.weight;
    data['age'] = this.age;
    data['breed'] = this.breed;
    return data;
  }
}
