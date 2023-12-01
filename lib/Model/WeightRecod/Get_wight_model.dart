class GetWightModel {
  bool? error;
  String? message;
  Data? data;

  GetWightModel({this.error, this.message, this.data});

  GetWightModel.fromJson(Map<String, dynamic> json) {
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
  String? animalId;
  String? weight;
  String? height;
  String? remark;
  String? createdAt;
  String? breed;

  Data(
      {this.id,
        this.animalId,
        this.weight,
        this.height,
        this.remark,
        this.createdAt,
        this.breed});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    animalId = json['animal_id'];
    weight = json['weight'];
    height = json['height'];
    remark = json['remark'];
    createdAt = json['created_at'];
    breed = json['breed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['animal_id'] = this.animalId;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['remark'] = this.remark;
    data['created_at'] = this.createdAt;
    data['breed'] = this.breed;
    return data;
  }
}
