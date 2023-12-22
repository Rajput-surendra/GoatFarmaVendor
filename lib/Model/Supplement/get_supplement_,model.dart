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
  String? title;
  String? stock;
  String? unit;

  Breed({this.id, this.title, this.stock,this.unit});

  Breed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    stock = json['stock'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['stock'] = this.stock;
    data['unit'] = this.unit;
    return data;
  }
}
