class MilkRecordModel {
  bool? error;
  String? message;
  List<MilkData>? data;

  MilkRecordModel({this.error, this.message, this.data});

  MilkRecordModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <MilkData>[];
      json['data'].forEach((v) {
        data!.add(new MilkData.fromJson(v));
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

class MilkData {
  String? id;
  String? animalId;
  String? milkQty;
  String? age;
  String? date;
  String? weight;
  String? breed;

  MilkData(
      {this.id,
        this.animalId,
        this.milkQty,
        this.age,
        this.date,
        this.weight,
        this.breed});

  MilkData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    animalId = json['animal_id'];
    milkQty = json['milk_qty'];
    age = json['age'];
    date = json['date'];
    weight = json['weight'];
    breed = json['breed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['animal_id'] = this.animalId;
    data['milk_qty'] = this.milkQty;
    data['age'] = this.age;
    data['date'] = this.date;
    data['weight'] = this.weight;
    data['breed'] = this.breed;
    return data;
  }
}
