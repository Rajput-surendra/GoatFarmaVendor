class MatingAnimalSingleDataModel {
  bool? error;
  String? message;
  Data? data;

  MatingAnimalSingleDataModel({this.error, this.message, this.data});

  MatingAnimalSingleDataModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  String? id;
  String? weight;
  String? age;
  String? catId;
  String? lastBreeder;
  String? breed;

  Data(
      {this.id,
        this.weight,
        this.age,
        this.catId,
        this.lastBreeder,
        this.breed});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    weight = json['weight'];
    age = json['age'];
    catId = json['cat_id'];
    lastBreeder = json['last_breeder'];
    breed = json['breed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['weight'] = this.weight;
    data['age'] = this.age;
    data['cat_id'] = this.catId;
    data['last_breeder'] = this.lastBreeder;
    data['breed'] = this.breed;
    return data;
  }
}
