class GetBreedingModel {
  bool? error;
  String? message;
  Data? data;

  GetBreedingModel({this.error, this.message, this.data});

  GetBreedingModel.fromJson(Map<String, dynamic> json) {
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
  String? catId;
  String? tagId;
  String? age;
  String? weight;
  String? breed;
  String? matingDate;

  Data(
      {this.id,
        this.catId,
        this.tagId,
        this.age,
        this.weight,
        this.breed,
        this.matingDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catId = json['cat_id'];
    tagId = json['tag_id'];
    age = json['age'];
    weight = json['weight'];
    breed = json['breed'];
    matingDate = json['mating_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cat_id'] = this.catId;
    data['tag_id'] = this.tagId;
    data['age'] = this.age;
    data['weight'] = this.weight;
    data['breed'] = this.breed;
    data['mating_date'] = this.matingDate;
    return data;
  }
}
