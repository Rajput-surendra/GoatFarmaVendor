class GetBreedingListModel {
  bool? error;
  String? message;
  List<Data>? data;

  GetBreedingListModel({this.error, this.message, this.data});

  GetBreedingListModel.fromJson(Map<String, dynamic> json) {
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
  String? tagId;
  String? birthDate;
  String? weight;
  String? gander;

  Data({this.id, this.tagId, this.birthDate, this.weight, this.gander});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tagId = json['tag_id'];
    birthDate = json['birth_date'];
    weight = json['weight'];
    gander = json['gander'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tag_id'] = this.tagId;
    data['birth_date'] = this.birthDate;
    data['weight'] = this.weight;
    data['gander'] = this.gander;
    return data;
  }
}
