/// error : false
/// message : "Record Get Sucessfully !"
/// data : [{"id":"46","medicine_id":"123","animal_id":"","category":"17","weight":"Tuu","dose":"trrf","unit":"ML","direction":"trst","safe_for_pregnant":"0","period":"OneTime","time":"Morning&Evening","day":"","date":"22-12-2023","status":"0","created_at":"2023-12-22 17:59:03","breed":"Sheep","medicine_name":"crocin"}]

class GetMedicineScheduleList {
  GetMedicineScheduleList({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GetMedicineScheduleList.fromJson(dynamic json) {
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
GetMedicineScheduleList copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => GetMedicineScheduleList(  error: error ?? _error,
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

/// id : "46"
/// medicine_id : "123"
/// animal_id : ""
/// category : "17"
/// weight : "Tuu"
/// dose : "trrf"
/// unit : "ML"
/// direction : "trst"
/// safe_for_pregnant : "0"
/// period : "OneTime"
/// time : "Morning&Evening"
/// day : ""
/// date : "22-12-2023"
/// status : "0"
/// created_at : "2023-12-22 17:59:03"
/// breed : "Sheep"
/// medicine_name : "crocin"

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
      String? period, 
      String? time, 
      String? day, 
      String? date, 
      String? status, 
      String? createdAt, 
      String? breed, 
      String? medicineName,}){
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
    _time = time;
    _day = day;
    _date = date;
    _status = status;
    _createdAt = createdAt;
    _breed = breed;
    _medicineName = medicineName;
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
    _time = json['time'];
    _day = json['day'];
    _date = json['date'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _breed = json['breed'];
    _medicineName = json['medicine_name'];
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
  String? _period;
  String? _time;
  String? _day;
  String? _date;
  String? _status;
  String? _createdAt;
  String? _breed;
  String? _medicineName;
Data copyWith({  String? id,
  String? medicineId,
  String? animalId,
  String? category,
  String? weight,
  String? dose,
  String? unit,
  String? direction,
  String? safeForPregnant,
  String? period,
  String? time,
  String? day,
  String? date,
  String? status,
  String? createdAt,
  String? breed,
  String? medicineName,
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
  time: time ?? _time,
  day: day ?? _day,
  date: date ?? _date,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  breed: breed ?? _breed,
  medicineName: medicineName ?? _medicineName,
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
  String? get period => _period;
  String? get time => _time;
  String? get day => _day;
  String? get date => _date;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get breed => _breed;
  String? get medicineName => _medicineName;

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
    map['time'] = _time;
    map['day'] = _day;
    map['date'] = _date;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['breed'] = _breed;
    map['medicine_name'] = _medicineName;
    return map;
  }

}