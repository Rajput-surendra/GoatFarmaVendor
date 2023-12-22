/// error : false
/// message : "Record Get Sucessfully !"
/// data : {"id":"4","medicine_type":"kids dd","medicine_id":"123","disease":"Fever","medicine_name":"crocin","qty":"1","exp_date":"20-12-2024","unit":"ml","created_at":"2023-12-22 11:18:07"}

class GetUpdateModel {
  GetUpdateModel({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GetUpdateModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
GetUpdateModel copyWith({  bool? error,
  String? message,
  Data? data,
}) => GetUpdateModel(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : "4"
/// medicine_type : "kids dd"
/// medicine_id : "123"
/// disease : "Fever"
/// medicine_name : "crocin"
/// qty : "1"
/// exp_date : "20-12-2024"
/// unit : "ml"
/// created_at : "2023-12-22 11:18:07"

class Data {
  Data({
      String? id, 
      String? medicineType, 
      String? medicineId, 
      String? disease, 
      String? medicineName, 
      String? qty, 
      String? expDate, 
      String? unit, 
      String? createdAt,}){
    _id = id;
    _medicineType = medicineType;
    _medicineId = medicineId;
    _disease = disease;
    _medicineName = medicineName;
    _qty = qty;
    _expDate = expDate;
    _unit = unit;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _medicineType = json['medicine_type'];
    _medicineId = json['medicine_id'];
    _disease = json['disease'];
    _medicineName = json['medicine_name'];
    _qty = json['qty'];
    _expDate = json['exp_date'];
    _unit = json['unit'];
    _createdAt = json['created_at'];
  }
  String? _id;
  String? _medicineType;
  String? _medicineId;
  String? _disease;
  String? _medicineName;
  String? _qty;
  String? _expDate;
  String? _unit;
  String? _createdAt;
Data copyWith({  String? id,
  String? medicineType,
  String? medicineId,
  String? disease,
  String? medicineName,
  String? qty,
  String? expDate,
  String? unit,
  String? createdAt,
}) => Data(  id: id ?? _id,
  medicineType: medicineType ?? _medicineType,
  medicineId: medicineId ?? _medicineId,
  disease: disease ?? _disease,
  medicineName: medicineName ?? _medicineName,
  qty: qty ?? _qty,
  expDate: expDate ?? _expDate,
  unit: unit ?? _unit,
  createdAt: createdAt ?? _createdAt,
);
  String? get id => _id;
  String? get medicineType => _medicineType;
  String? get medicineId => _medicineId;
  String? get disease => _disease;
  String? get medicineName => _medicineName;
  String? get qty => _qty;
  String? get expDate => _expDate;
  String? get unit => _unit;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['medicine_type'] = _medicineType;
    map['medicine_id'] = _medicineId;
    map['disease'] = _disease;
    map['medicine_name'] = _medicineName;
    map['qty'] = _qty;
    map['exp_date'] = _expDate;
    map['unit'] = _unit;
    map['created_at'] = _createdAt;
    return map;
  }

}