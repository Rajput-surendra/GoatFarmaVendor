/// error : false
/// message : "Record Get Sucessfully !"
/// data : [{"id":"94","medicine_type":"Medicine","medicine_id":"ss120","disease":"Brucellosis","medicine_name":"test ho ","qty":"21","exp_date":"26-12-2023","unit":"Liter","safe_for_pregnent":"NO","description":"india demo","created_at":"2023-12-25 12:26:53"}]

class GetMedicineSingleDataModel {
  GetMedicineSingleDataModel({
      bool? error, 
      String? message, 
      List<MedicineDataa>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GetMedicineSingleDataModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(MedicineDataa.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<MedicineDataa>? _data;
GetMedicineSingleDataModel copyWith({  bool? error,
  String? message,
  List<MedicineDataa>? data,
}) => GetMedicineSingleDataModel(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<MedicineDataa>? get data => _data;

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

/// id : "94"
/// medicine_type : "Medicine"
/// medicine_id : "ss120"
/// disease : "Brucellosis"
/// medicine_name : "test ho "
/// qty : "21"
/// exp_date : "26-12-2023"
/// unit : "Liter"
/// safe_for_pregnent : "NO"
/// description : "india demo"
/// created_at : "2023-12-25 12:26:53"

class MedicineDataa {
  MedicineDate({
      String? id, 
      String? medicineType, 
      String? medicineId, 
      String? disease, 
      String? medicineName, 
      String? qty, 
      String? expDate, 
      String? unit, 
      String? safeForPregnent, 
      String? description, 
      String? createdAt,}){
    _id = id;
    _medicineType = medicineType;
    _medicineId = medicineId;
    _disease = disease;
    _medicineName = medicineName;
    _qty = qty;
    _expDate = expDate;
    _unit = unit;
    _safeForPregnent = safeForPregnent;
    _description = description;
    _createdAt = createdAt;
}

  MedicineDataa.fromJson(dynamic json) {
    _id = json['id'];
    _medicineType = json['medicine_type'];
    _medicineId = json['medicine_id'];
    _disease = json['disease'];
    _medicineName = json['medicine_name'];
    _qty = json['qty'];
    _expDate = json['exp_date'];
    _unit = json['unit'];
    _safeForPregnent = json['safe_for_pregnent'];
    _description = json['description'];
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
  String? _safeForPregnent;
  String? _description;
  String? _createdAt;
  MedicineDataa copyWith({  String? id,
  String? medicineType,
  String? medicineId,
  String? disease,
  String? medicineName,
  String? qty,
  String? expDate,
  String? unit,
  String? safeForPregnent,
  String? description,
  String? createdAt,
}) => MedicineDate(  id: id ?? _id,
  medicineType: medicineType ?? _medicineType,
  medicineId: medicineId ?? _medicineId,
  disease: disease ?? _disease,
  medicineName: medicineName ?? _medicineName,
  qty: qty ?? _qty,
  expDate: expDate ?? _expDate,
  unit: unit ?? _unit,
  safeForPregnent: safeForPregnent ?? _safeForPregnent,
  description: description ?? _description,
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
  String? get safeForPregnent => _safeForPregnent;
  String? get description => _description;
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
    map['safe_for_pregnent'] = _safeForPregnent;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    return map;
  }

}