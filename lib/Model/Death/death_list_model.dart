class GetDeathModel {
  bool? error;
  String? message;
  List<Data>? data;

  GetDeathModel({this.error, this.message, this.data});

  GetDeathModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? animalId;
  String? weight;
  String? reason;
  String? createdAt;
  String? breed;
  String? gander;
  String? age;

  Data(
      {this.id,
        this.animalId,
        this.weight,
        this.reason,
        this.createdAt,
        this.breed,
        this.gander,
        this.age});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    animalId = json['animal_id'];
    weight = json['weight'];
    reason = json['reason'];
    createdAt = json['created_at'];
    breed = json['breed'];
    gander = json['gander'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['animal_id'] = this.animalId;
    data['weight'] = this.weight;
    data['reason'] = this.reason;
    data['created_at'] = this.createdAt;
    data['breed'] = this.breed;
    data['gander'] = this.gander;
    data['age'] = this.age;
    return data;
  }
}
