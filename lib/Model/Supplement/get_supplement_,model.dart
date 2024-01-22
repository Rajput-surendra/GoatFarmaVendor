class GetSupplementModel {
  bool? error;
  String? message;
  List<Breed>? breed;

  GetSupplementModel({this.error, this.message, this.breed});

  GetSupplementModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['breed'] != null) {
      breed = <Breed>[];
      json['breed'].forEach((v) {
        breed!.add(new Breed.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.breed != null) {
      data['breed'] = this.breed!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Breed {
  String? id;
  String? supplementId;
  String? userId;
  String? supplementName;
  String? unit;
  String? qty;
  String? safeForPregnent;
  String? description;
  String? createdAt;

  Breed(
      {this.id,
        this.supplementId,
        this.userId,
        this.supplementName,
        this.unit,
        this.qty,
        this.safeForPregnent,
        this.description,
        this.createdAt});

  Breed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supplementId = json['supplement_id'];
    userId = json['user_id'];
    supplementName = json['supplement_name'];
    unit = json['unit'];
    qty = json['qty'];
    safeForPregnent = json['safe_for_pregnent'];
    description = json['description'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['supplement_id'] = this.supplementId;
    data['user_id'] = this.userId;
    data['supplement_name'] = this.supplementName;
    data['unit'] = this.unit;
    data['qty'] = this.qty;
    data['safe_for_pregnent'] = this.safeForPregnent;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    return data;
  }
}
