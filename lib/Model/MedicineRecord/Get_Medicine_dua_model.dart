/// error : false
/// message : "Record Get Sucessfully !"
/// data : [{"id":"4","medicine_id":"4","animal_id":"MD101","category":"1","weight":"10","dose":"1","unit":"ml","direction":"use with 1 cup hot whater","safe_for_pregnant":"1","period":null,"day":null,"date":"2023-12-20","status":"0","created_at":"2023-12-21 16:49:33"},{"id":"5","medicine_id":"4","animal_id":"MD101","category":"1","weight":"10","dose":"1","unit":"ml","direction":"use with 1 cup hot whater","safe_for_pregnant":"1","period":null,"day":null,"date":"2023-12-20","status":"0","created_at":"2023-12-21 16:49:33"}]

class GetMedicineDuaModel {
  GetMedicineDuaModel({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GetMedicineDuaModel.fromJson(dynamic json) {
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
GetMedicineDuaModel copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => GetMedicineDuaModel(  error: error ?? _error,
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

/// id : "4"
/// medicine_id : "4"
/// animal_id : "MD101"
/// category : "1"
/// weight : "10"
/// dose : "1"
/// unit : "ml"
/// direction : "use with 1 cup hot whater"
/// safe_for_pregnant : "1"
/// period : null
/// day : null
/// date : "2023-12-20"
/// status : "0"
/// created_at : "2023-12-21 16:49:33"

class Data {
  Data({
      String? id, 
      String? medicineId, 
      String? animalId, 
      String? category, 
      String? weight, 
      String? dose, 
      String? unit, 
      String? direction, 
      String? safeForPregnant, 
      dynamic period, 
      dynamic day, 
      String? date, 
      String? status, 
      String? createdAt,}){
    _id = id;
    _medicineId = medicineId;
    _animalId = animalId;
    _category = category;
    _weight = weight;
    _dose = dose;
    _unit = unit;
    _direction = direction;
    _safeForPregnant = safeForPregnant;
    _period = period;
    _day = day;
    _date = date;
    _status = status;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _medicineId = json['medicine_id'];
    _animalId = json['animal_id'];
    _category = json['category'];
    _weight = json['weight'];
    _dose = json['dose'];
    _unit = json['unit'];
    _direction = json['direction'];
    _safeForPregnant = json['safe_for_pregnant'];
    _period = json['period'];
    _day = json['day'];
    _date = json['date'];
    _status = json['status'];
    _createdAt = json['created_at'];
  }
  String? _id;
  String? _medicineId;
  String? _animalId;
  String? _category;
  String? _weight;
  String? _dose;
  String? _unit;
  String? _direction;
  String? _safeForPregnant;
  dynamic _period;
  dynamic _day;
  String? _date;
  String? _status;
  String? _createdAt;
Data copyWith({  String? id,
  String? medicineId,
  String? animalId,
  String? category,
  String? weight,
  String? dose,
  String? unit,
  String? direction,
  String? safeForPregnant,
  dynamic period,
  dynamic day,
  String? date,
  String? status,
  String? createdAt,
}) => Data(  id: id ?? _id,
  medicineId: medicineId ?? _medicineId,
  animalId: animalId ?? _animalId,
  category: category ?? _category,
  weight: weight ?? _weight,
  dose: dose ?? _dose,
  unit: unit ?? _unit,
  direction: direction ?? _direction,
  safeForPregnant: safeForPregnant ?? _safeForPregnant,
  period: period ?? _period,
  day: day ?? _day,
  date: date ?? _date,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
);
  String? get id => _id;
  String? get medicineId => _medicineId;
  String? get animalId => _animalId;
  String? get category => _category;
  String? get weight => _weight;
  String? get dose => _dose;
  String? get unit => _unit;
  String? get direction => _direction;
  String? get safeForPregnant => _safeForPregnant;
  dynamic get period => _period;
  dynamic get day => _day;
  String? get date => _date;
  String? get status => _status;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['medicine_id'] = _medicineId;
    map['animal_id'] = _animalId;
    map['category'] = _category;
    map['weight'] = _weight;
    map['dose'] = _dose;
    map['unit'] = _unit;
    map['direction'] = _direction;
    map['safe_for_pregnant'] = _safeForPregnant;
    map['period'] = _period;
    map['day'] = _day;
    map['date'] = _date;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    return map;
  }

}