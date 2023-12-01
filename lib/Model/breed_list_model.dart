class BreedListModel {
  bool? error;
  String? message;
  List<BreedDataList>? data;

  BreedListModel({this.error, this.message, this.data});

  BreedListModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BreedDataList>[];
      json['data'].forEach((v) {
        data!.add(new BreedDataList.fromJson(v));
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

class BreedDataList {
  String? id;
  String? kids;
  String? emty;
  String? matted;
  String? pregnent;
  String? motherHood;
  String? grower;
  String? parent;
  String? createdAt;

  BreedDataList(
      {this.id,
        this.kids,
        this.emty,
        this.matted,
        this.pregnent,
        this.motherHood,
        this.grower,
        this.parent,
        this.createdAt});

  BreedDataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kids = json['kids'];
    emty = json['emty'];
    matted = json['matted'];
    pregnent = json['pregnent'];
    motherHood = json['mother_hood'];
    grower = json['grower'];
    parent = json['parent'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kids'] = this.kids;
    data['emty'] = this.emty;
    data['matted'] = this.matted;
    data['pregnent'] = this.pregnent;
    data['mother_hood'] = this.motherHood;
    data['grower'] = this.grower;
    data['parent'] = this.parent;
    data['created_at'] = this.createdAt;
    return data;
  }
}
