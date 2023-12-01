class PurchageCatModel {
  bool? error;
  String? message;
  List<PurchageData>? data;

  PurchageCatModel({this.error, this.message, this.data});

  PurchageCatModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PurchageData>[];
      json['data'].forEach((v) {
        data!.add(new PurchageData.fromJson(v));
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

class PurchageData {
  String? id;
  String? name;
  String? status;
  String? createdAt;

  PurchageData({this.id, this.name, this.status, this.createdAt});

  PurchageData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}
