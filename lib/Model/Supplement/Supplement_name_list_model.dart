/// error : false
/// message : "Record Get Sucessfully !"
/// breed : [{"id":"5","supplement_id":"0","user_id":"73","supplement_name":"Harish","unit":"No","qty":"2","safe_for_pregnent":"NO","description":"test","created_at":"2024-01-19 13:36:53"}]

class SupplementNameListModel {
  SupplementNameListModel({
      bool? error, 
      String? message, 
      List<SupplentName>? breed,}){
    _error = error;
    _message = message;
    _breed = breed;
}

  SupplementNameListModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['breed'] != null) {
      _breed = [];
      json['breed'].forEach((v) {
        _breed?.add(SupplentName.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<SupplentName>? _breed;
SupplementNameListModel copyWith({  bool? error,
  String? message,
  List<SupplentName>? breed,
}) => SupplementNameListModel(  error: error ?? _error,
  message: message ?? _message,
  breed: breed ?? _breed,
);
  bool? get error => _error;
  String? get message => _message;
  List<SupplentName>? get breed => _breed;

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

/// id : "5"
/// supplement_id : "0"
/// user_id : "73"
/// supplement_name : "Harish"
/// unit : "No"
/// qty : "2"
/// safe_for_pregnent : "NO"
/// description : "test"
/// created_at : "2024-01-19 13:36:53"

class SupplentName {
  SupplentName({
      String? id, 
      String? supplementId, 
      String? userId, 
      String? supplementName, 
      String? unit, 
      String? qty, 
      String? safeForPregnent, 
      String? description, 
      String? createdAt,}){
    _id = id;
    _supplementId = supplementId;
    _userId = userId;
    _supplementName = supplementName;
    _unit = unit;
    _qty = qty;
    _safeForPregnent = safeForPregnent;
    _description = description;
    _createdAt = createdAt;
}

  SupplentName.fromJson(dynamic json) {
    _id = json['id'];
    _supplementId = json['supplement_id'];
    _userId = json['user_id'];
    _supplementName = json['supplement_name'];
    _unit = json['unit'];
    _qty = json['qty'];
    _safeForPregnent = json['safe_for_pregnent'];
    _description = json['description'];
    _createdAt = json['created_at'];
  }
  String? _id;
  String? _supplementId;
  String? _userId;
  String? _supplementName;
  String? _unit;
  String? _qty;
  String? _safeForPregnent;
  String? _description;
  String? _createdAt;
  SupplentName copyWith({  String? id,
  String? supplementId,
  String? userId,
  String? supplementName,
  String? unit,
  String? qty,
  String? safeForPregnent,
  String? description,
  String? createdAt,
}) => SupplentName(  id: id ?? _id,
  supplementId: supplementId ?? _supplementId,
  userId: userId ?? _userId,
  supplementName: supplementName ?? _supplementName,
  unit: unit ?? _unit,
  qty: qty ?? _qty,
  safeForPregnent: safeForPregnent ?? _safeForPregnent,
  description: description ?? _description,
  createdAt: createdAt ?? _createdAt,
);
  String? get id => _id;
  String? get supplementId => _supplementId;
  String? get userId => _userId;
  String? get supplementName => _supplementName;
  String? get unit => _unit;
  String? get qty => _qty;
  String? get safeForPregnent => _safeForPregnent;
  String? get description => _description;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['supplement_id'] = _supplementId;
    map['user_id'] = _userId;
    map['supplement_name'] = _supplementName;
    map['unit'] = _unit;
    map['qty'] = _qty;
    map['safe_for_pregnent'] = _safeForPregnent;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    return map;
  }

}