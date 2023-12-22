/// error : false
/// message : "Records retrieved successfully!"
/// data : [{"id":"8","supliment_id":"SUP01","category":"1","breed_type":"kids","supliment_name":"test","supliment":"['gehu','chana','makka']","weight":"['20','15','17']","unit":"Kg","dose":"all time","body_weight":null,"day_after":"20","time":"2","status":"0","created_at":"2023-12-20 13:23:09"}]

class GetSupplementDueRecordModel {
  GetSupplementDueRecordModel({
      bool? error,
      String? message,
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GetSupplementDueRecordModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<Data>? _data;
GetSupplementDueRecordModel copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => GetSupplementDueRecordModel(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "8"
/// supliment_id : "SUP01"
/// category : "1"
/// breed_type : "kids"
/// supliment_name : "test"
/// supliment : "['gehu','chana','makka']"
/// weight : "['20','15','17']"
/// unit : "Kg"
/// dose : "all time"
/// body_weight : null
/// day_after : "20"
/// time : "2"
/// status : "0"
/// created_at : "2023-12-20 13:23:09"

class Data {
  Data({
      String? id,
      String? suplimentId,
      String? category,
      String? breedType,
      String? suplimentName,
      String? supliment,
      String? weight,
      String? unit,
      String? dose,
      dynamic bodyWeight,
      String? dayAfter,
      String? time,
      String? status,
      String? createdAt,}){
    _id = id;
    _suplimentId = suplimentId;
    _category = category;
    _breedType = breedType;
    _suplimentName = suplimentName;
    _supliment = supliment;
    _weight = weight;
    _unit = unit;
    _dose = dose;
    _bodyWeight = bodyWeight;
    _dayAfter = dayAfter;
    _time = time;
    _status = status;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _suplimentId = json['supliment_id'];
    _category = json['category'];
    _breedType = json['breed_type'];
    _suplimentName = json['supliment_name'];
    _supliment = json['supliment'];
    _weight = json['weight'];
    _unit = json['unit'];
    _dose = json['dose'];
    _bodyWeight = json['body_weight'];
    _dayAfter = json['day_after'];
    _time = json['time'];
    _status = json['status'];
    _createdAt = json['created_at'];
  }
  String? _id;
  String? _suplimentId;
  String? _category;
  String? _breedType;
  String? _suplimentName;
  String? _supliment;
  String? _weight;
  String? _unit;
  String? _dose;
  dynamic _bodyWeight;
  String? _dayAfter;
  String? _time;
  String? _status;
  String? _createdAt;
Data copyWith({  String? id,
  String? suplimentId,
  String? category,
  String? breedType,
  String? suplimentName,
  String? supliment,
  String? weight,
  String? unit,
  String? dose,
  dynamic bodyWeight,
  String? dayAfter,
  String? time,
  String? status,
  String? createdAt,
}) => Data(  id: id ?? _id,
  suplimentId: suplimentId ?? _suplimentId,
  category: category ?? _category,
  breedType: breedType ?? _breedType,
  suplimentName: suplimentName ?? _suplimentName,
  supliment: supliment ?? _supliment,
  weight: weight ?? _weight,
  unit: unit ?? _unit,
  dose: dose ?? _dose,
  bodyWeight: bodyWeight ?? _bodyWeight,
  dayAfter: dayAfter ?? _dayAfter,
  time: time ?? _time,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
);
  String? get id => _id;
  String? get suplimentId => _suplimentId;
  String? get category => _category;
  String? get breedType => _breedType;
  String? get suplimentName => _suplimentName;
  String? get supliment => _supliment;
  String? get weight => _weight;
  String? get unit => _unit;
  String? get dose => _dose;
  dynamic get bodyWeight => _bodyWeight;
  String? get dayAfter => _dayAfter;
  String? get time => _time;
  String? get status => _status;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['supliment_id'] = _suplimentId;
    map['category'] = _category;
    map['breed_type'] = _breedType;
    map['supliment_name'] = _suplimentName;
    map['supliment'] = _supliment;
    map['weight'] = _weight;
    map['unit'] = _unit;
    map['dose'] = _dose;
    map['body_weight'] = _bodyWeight;
    map['day_after'] = _dayAfter;
    map['time'] = _time;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    return map;
  }

}