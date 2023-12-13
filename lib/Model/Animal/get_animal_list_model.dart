class GetSubListBreedModel {
  bool? error;
  String? message;
  List<BreedCatList>? data;

  GetSubListBreedModel({this.error, this.message, this.data});

  GetSubListBreedModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BreedCatList>[];
      json['data'].forEach((v) {
        data!.add(new BreedCatList.fromJson(v));
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

class BreedCatList {
  String? id;
  String? name;
  String? parentId;
  String? status;

  BreedCatList({this.id, this.name, this.parentId, this.status});

  BreedCatList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parent_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['parent_id'] = this.parentId;
    data['status'] = this.status;
    return data;
  }
}
