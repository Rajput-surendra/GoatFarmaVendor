class GetMatingListModel {
  bool? error;
  String? message;
  List<Data>? data;

  GetMatingListModel({this.error, this.message, this.data});

  GetMatingListModel.fromJson(Map<String, dynamic> json) {
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
  Null? date;
  String? maleTag;
  String? maleId;
  Null? maleBreed;
  String? femaleTag;
  String? femaleId;
  String? meatingType;
  String? breeding;
  String? meatingStatus;
  String? expectedDueDate;
  Null? dose;
  Null? semen;
  Null? nogOfBreed;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.date,
        this.maleTag,
        this.maleId,
        this.maleBreed,
        this.femaleTag,
        this.femaleId,
        this.meatingType,
        this.breeding,
        this.meatingStatus,
        this.expectedDueDate,
        this.dose,
        this.semen,
        this.nogOfBreed,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    maleTag = json['male_tag'];
    maleId = json['male_id'];
    maleBreed = json['male_breed'];
    femaleTag = json['female_tag'];
    femaleId = json['female_id'];
    meatingType = json['meating_type'];
    breeding = json['breeding'];
    meatingStatus = json['meating_status'];
    expectedDueDate = json['expected_due_date'];
    dose = json['dose'];
    semen = json['semen'];
    nogOfBreed = json['nog_of_breed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['male_tag'] = this.maleTag;
    data['male_id'] = this.maleId;
    data['male_breed'] = this.maleBreed;
    data['female_tag'] = this.femaleTag;
    data['female_id'] = this.femaleId;
    data['meating_type'] = this.meatingType;
    data['breeding'] = this.breeding;
    data['meating_status'] = this.meatingStatus;
    data['expected_due_date'] = this.expectedDueDate;
    data['dose'] = this.dose;
    data['semen'] = this.semen;
    data['nog_of_breed'] = this.nogOfBreed;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
