/// error : false
/// message : "Record Get Sucessfully !"
/// breed : [{"id":"1","supplement_id":"1","category":"15","body_weight":"11","dose":"1","unit":"ML","created_at":"2024-01-19 13:16:58"},{"id":"2","supplement_id":"1","category":"17","body_weight":"1","dose":"3","unit":"Liter","created_at":"2024-01-19 13:16:58"}]

class GetSupplementDetailsModel {
  GetSupplementDetailsModel({
      bool? error, 
      String? message, 
      List<Breed>? breed,}){
    _error = error;
    _message = message;
    _breed = breed;
}

  GetSupplementDetailsModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['breed'] != null) {
      _breed = [];
      json['breed'].forEach((v) {
        _breed?.add(Breed.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<Breed>? _breed;
GetSupplementDetailsModel copyWith({  bool? error,
  String? message,
  List<Breed>? breed,
}) => GetSupplementDetailsModel(  error: error ?? _error,
  message: message ?? _message,
  breed: breed ?? _breed,
);
  bool? get error => _error;
  String? get message => _message;
  List<Breed>? get breed => _breed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_breed != null) {
      map['breed'] = _breed?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1"
/// supplement_id : "1"
/// category : "15"
/// body_weight : "11"
/// dose : "1"
/// unit : "ML"
/// created_at : "2024-01-19 13:16:58"

class Breed {
  Breed({
      String? id, 
      String? supplementId, 
      String? category, 
      String? bodyWeight, 
      String? dose, 
      String? unit, 
      String? createdAt,}){
    _id = id;
    _supplementId = supplementId;
    _category = category;
    _bodyWeight = bodyWeight;
    _dose = dose;
    _unit = unit;
    _createdAt = createdAt;
}

  Breed.fromJson(dynamic json) {
    _id = json['id'];
    _supplementId = json['supplement_id'];
    _category = json['category'];
    _bodyWeight = json['body_weight'];
    _dose = json['dose'];
    _unit = json['unit'];
    _createdAt = json['created_at'];
  }
  String? _id;
  String? _supplementId;
  String? _category;
  String? _bodyWeight;
  String? _dose;
  String? _unit;
  String? _createdAt;
Breed copyWith({  String? id,
  String? supplementId,
  String? category,
  String? bodyWeight,
  String? dose,
  String? unit,
  String? createdAt,
}) => Breed(  id: id ?? _id,
  supplementId: supplementId ?? _supplementId,
  category: category ?? _category,
  bodyWeight: bodyWeight ?? _bodyWeight,
  dose: dose ?? _dose,
  unit: unit ?? _unit,
  createdAt: createdAt ?? _createdAt,
);
  String? get id => _id;
  String? get supplementId => _supplementId;
  String? get category => _category;
  String? get bodyWeight => _bodyWeight;
  String? get dose => _dose;
  String? get unit => _unit;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['supplement_id'] = _supplementId;
    map['category'] = _category;
    map['body_weight'] = _bodyWeight;
    map['dose'] = _dose;
    map['unit'] = _unit;
    map['created_at'] = _createdAt;
    return map;
  }

}