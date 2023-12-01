class MilkFiltterModel {
  bool? error;
  String? message;
  MilkDataList? data;

  MilkFiltterModel({this.error, this.message, this.data});

  MilkFiltterModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new MilkDataList.fromJson(json['data']) : null;
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

class MilkDataList {
  String? id;
  String? animalId;
  String? milkQty;
  String? age;
  String? date;
  String? breed;
  String? weight;

  MilkDataList(
      {this.id,
        this.animalId,
        this.milkQty,
        this.age,
        this.date,
        this.breed,
        this.weight});

  MilkDataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    animalId = json['animal_id'];
    milkQty = json['milk_qty'];
    age = json['age'];
    date = json['date'];
    breed = json['breed'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['animal_id'] = this.animalId;
    data['milk_qty'] = this.milkQty;
    data['age'] = this.age;
    data['date'] = this.date;
    data['breed'] = this.breed;
    data['weight'] = this.weight;
    return data;
  }
}
