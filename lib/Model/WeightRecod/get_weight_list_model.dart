/// error : false
/// message : "Data Sucessfully Get !"
/// data : [{"id":"2","animal_id":"7","weight":"36","height":"12","remark":"test","created_at":"2023-11-20 11:51:18"},{"id":"3","animal_id":"7","weight":"39","height":"13","remark":"test","created_at":"2023-11-20 12:29:49"},{"id":"4","animal_id":"27","weight":"9","height":null,"remark":null,"created_at":"2023-11-20 12:44:35"},{"id":"6","animal_id":"29","weight":"17","height":null,"remark":null,"created_at":"2023-11-20 13:03:00"},{"id":"7","animal_id":"30","weight":"11","height":null,"remark":null,"created_at":"2023-11-20 13:07:51"},{"id":"10","animal_id":"33","weight":"17","height":null,"remark":null,"created_at":"2023-11-20 15:07:17"},{"id":"11","animal_id":"34","weight":"55","height":null,"remark":null,"created_at":"2023-11-20 15:15:09"},{"id":"12","animal_id":"35","weight":"55","height":null,"remark":null,"created_at":"2023-11-20 15:17:21"},{"id":"13","animal_id":"36","weight":"55","height":null,"remark":null,"created_at":"2023-11-20 15:21:20"},{"id":"14","animal_id":"37","weight":"55","height":null,"remark":null,"created_at":"2023-11-20 15:25:40"},{"id":"15","animal_id":"38","weight":"55","height":null,"remark":null,"created_at":"2023-11-20 15:29:15"},{"id":"16","animal_id":"39","weight":"58","height":null,"remark":null,"created_at":"2023-11-20 15:30:36"},{"id":"17","animal_id":"40","weight":"17","height":null,"remark":null,"created_at":"2023-11-20 15:35:00"},{"id":"19","animal_id":"42","weight":"2","height":null,"remark":null,"created_at":"2023-11-20 15:46:42"},{"id":"20","animal_id":"43","weight":"0","height":null,"remark":null,"created_at":"2023-11-21 18:07:02"},{"id":"21","animal_id":"44","weight":"85","height":null,"remark":null,"created_at":"2023-11-21 18:09:11"},{"id":"22","animal_id":"12","weight":"58","height":"0","remark":"yffyfy","created_at":"2023-12-01 13:42:27"},{"id":"23","animal_id":"12","weight":"58","height":"0","remark":"yffyfy","created_at":"2023-12-01 13:42:44"},{"id":"24","animal_id":"10","weight":"12","height":"2","remark":"test","created_at":"2023-12-01 14:42:39"},{"id":"25","animal_id":"15","weight":"12","height":"25","remark":"demo","created_at":"2023-12-01 15:15:21"}]

class GetWeightListModel {
  GetWeightListModel({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GetWeightListModel.fromJson(dynamic json) {
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
GetWeightListModel copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => GetWeightListModel(  error: error ?? _error,
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

/// id : "2"
/// animal_id : "7"
/// weight : "36"
/// height : "12"
/// remark : "test"
/// created_at : "2023-11-20 11:51:18"

class Data {
  Data({
      String? id, 
      String? animalId, 
      String? weight, 
      String? height, 
      String? remark, 
      String? createdAt,}){
    _id = id;
    _animalId = animalId;
    _weight = weight;
    _height = height;
    _remark = remark;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _animalId = json['animal_id'];
    _weight = json['weight'];
    _height = json['height'];
    _remark = json['remark'];
    _createdAt = json['created_at'];
  }
  String? _id;
  String? _animalId;
  String? _weight;
  String? _height;
  String? _remark;
  String? _createdAt;
Data copyWith({  String? id,
  String? animalId,
  String? weight,
  String? height,
  String? remark,
  String? createdAt,
}) => Data(  id: id ?? _id,
  animalId: animalId ?? _animalId,
  weight: weight ?? _weight,
  height: height ?? _height,
  remark: remark ?? _remark,
  createdAt: createdAt ?? _createdAt,
);
  String? get id => _id;
  String? get animalId => _animalId;
  String? get weight => _weight;
  String? get height => _height;
  String? get remark => _remark;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['animal_id'] = _animalId;
    map['weight'] = _weight;
    map['height'] = _height;
    map['remark'] = _remark;
    map['created_at'] = _createdAt;
    return map;
  }

}