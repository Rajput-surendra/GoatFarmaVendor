/// error : false
/// message : "Record Get Sucessfully !"
/// data : [{"id":"4","medicine_type":"kids","medicine_id":"123","disease":"Fever","medicine_name":"crocin","qty":"1","exp_date":"20-12-2024","unit":"ml","safe_for_pregnent":null,"description":null,"created_at":"2023-12-22 11:56:11","shadule_data":[{"id":"10","medicine_id":"123","category":"15","body_weight":"ttt","dose":"chcgfgcg","medicine_unit":"ML","created_at":"2023-12-23 18:52:14"}]},{"id":"7","medicine_type":"kids","medicine_id":"12","disease":"Fever","medicine_name":"crocin","qty":"1","exp_date":"20-12-2024","unit":"ML","safe_for_pregnent":null,"description":null,"created_at":"2023-12-22 12:05:52","shadule_data":[]},{"id":"8","medicine_type":"kids","medicine_id":"1255","disease":"Canine Flu","medicine_name":"hhhhh","qty":null,"exp_date":"28-12-2023","unit":"KG","safe_for_pregnent":null,"description":null,"created_at":"2023-12-22 12:09:18","shadule_data":[]},{"id":"9","medicine_type":"Kids","medicine_id":"PT124","disease":"Anthrax","medicine_name":"Fever ","qty":null,"exp_date":"28-12-2023","unit":"Liter","safe_for_pregnent":null,"description":null,"created_at":"2023-12-22 12:20:56","shadule_data":[]},{"id":"10","medicine_type":"Male","medicine_id":"pz127","disease":"Botulism","medicine_name":"test ","qty":"25","exp_date":"27-12-2023","unit":"MG","safe_for_pregnent":null,"description":null,"created_at":"2023-12-22 12:30:02","shadule_data":[]},{"id":"11","medicine_type":"Male","medicine_id":"123","disease":"Botulism","medicine_name":"test","qty":"20","exp_date":"31-12-2023","unit":"KG","safe_for_pregnent":null,"description":null,"created_at":"2023-12-22 19:32:49","shadule_data":[{"id":"10","medicine_id":"123","category":"15","body_weight":"ttt","dose":"chcgfgcg","medicine_unit":"ML","created_at":"2023-12-23 18:52:14"}]},{"id":"12","medicine_type":"Male","medicine_id":"123","disease":"Botulism","medicine_name":"test","qty":"200","exp_date":"31-12-2023","unit":"KG","safe_for_pregnent":null,"description":null,"created_at":"2023-12-22 19:37:24","shadule_data":[{"id":"10","medicine_id":"123","category":"15","body_weight":"ttt","dose":"chcgfgcg","medicine_unit":"ML","created_at":"2023-12-23 18:52:14"}]},{"id":"62","medicine_type":" Medicine","medicine_id":" 102","disease":" Canine Flu","medicine_name":" crocodile","qty":" 1","exp_date":" 22-12-2023","unit":" MG","safe_for_pregnent":"0","description":"Test","created_at":"2023-12-23 17:46:16","shadule_data":[{"id":"5","medicine_id":" 102","category":"15","body_weight":"12","dose":"one","medicine_unit":"ML","created_at":"2023-12-23 17:46:16"},{"id":"6","medicine_id":" 102","category":"17","body_weight":"ttt","dose":"yyyy","medicine_unit":"MG","created_at":"2023-12-23 17:46:16"}]},{"id":"63","medicine_type":"Vaccine","medicine_id":"120","disease":"Canine Flu","medicine_name":"test","qty":"1","exp_date":"27-12-2023","unit":"ML","safe_for_pregnent":"male","description":"","created_at":"2023-12-23 17:56:22","shadule_data":[{"id":"7","medicine_id":"120","category":"[","body_weight":"[","dose":"[","medicine_unit":"[","created_at":"2023-12-23 17:56:22"},{"id":"11","medicine_id":"120","category":"15","body_weight":"12.3","dose":"test","medicine_unit":"KG","created_at":"2023-12-23 18:54:26"},{"id":"12","medicine_id":"120","category":"17","body_weight":"1.32","dose":"testdemo","medicine_unit":"KG","created_at":"2023-12-23 18:54:26"}]},{"id":"64","medicine_type":"Vaccine","medicine_id":"ffg","disease":"Botulism","medicine_name":"gvgbg","qty":"58559","exp_date":"21-12-2023","unit":"ML","safe_for_pregnent":"female","description":"","created_at":"2023-12-23 18:03:51","shadule_data":[{"id":"8","medicine_id":"ffg","category":"[","body_weight":"[","dose":"[","medicine_unit":"[","created_at":"2023-12-23 18:03:51"}]},{"id":"65","medicine_type":"Medicine","medicine_id":"rfrf","disease":"Canine Flu","medicine_name":"tcctt","qty":"8258858","exp_date":"28-12-2023","unit":"KG","safe_for_pregnent":"female","description":"","created_at":"2023-12-23 18:07:16","shadule_data":[{"id":"9","medicine_id":"rfrf","category":"1","body_weight":"f","dose":"f","medicine_unit":"N","created_at":"2023-12-23 18:07:16"}]},{"id":"66","medicine_type":"Vaccine","medicine_id":"123","disease":"Anthrax","medicine_name":"denldi","qty":"21254","exp_date":"13-12-2023","unit":"KG","safe_for_pregnent":null,"description":null,"created_at":"2023-12-23 18:52:14","shadule_data":[{"id":"10","medicine_id":"123","category":"15","body_weight":"ttt","dose":"chcgfgcg","medicine_unit":"ML","created_at":"2023-12-23 18:52:14"}]},{"id":"67","medicine_type":"Vaccine","medicine_id":"120","disease":"Botulism","medicine_name":"demi","qty":"12","exp_date":"28-12-2023","unit":"MG","safe_for_pregnent":null,"description":null,"created_at":"2023-12-23 18:54:26","shadule_data":[{"id":"7","medicine_id":"120","category":"[","body_weight":"[","dose":"[","medicine_unit":"[","created_at":"2023-12-23 17:56:22"},{"id":"11","medicine_id":"120","category":"15","body_weight":"12.3","dose":"test","medicine_unit":"KG","created_at":"2023-12-23 18:54:26"},{"id":"12","medicine_id":"120","category":"17","body_weight":"1.32","dose":"testdemo","medicine_unit":"KG","created_at":"2023-12-23 18:54:26"}]}]

class GetMedicineModel {
  GetMedicineModel({
      bool? error, 
      String? message, 
      List<MedicineDate>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GetMedicineModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(MedicineDate.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<MedicineDate>? _data;
GetMedicineModel copyWith({  bool? error,
  String? message,
  List<MedicineDate>? data,
}) => GetMedicineModel(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<MedicineDate>? get data => _data;

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
/// medicine_type : "kids"
/// medicine_id : "123"
/// disease : "Fever"
/// medicine_name : "crocin"
/// qty : "1"
/// exp_date : "20-12-2024"
/// unit : "ml"
/// safe_for_pregnent : null
/// description : null
/// created_at : "2023-12-22 11:56:11"
/// shadule_data : [{"id":"10","medicine_id":"123","category":"15","body_weight":"ttt","dose":"chcgfgcg","medicine_unit":"ML","created_at":"2023-12-23 18:52:14"}]

class MedicineDate {
  MedicineDate({
      String? id, 
      String? medicineType, 
      String? medicineId, 
      String? disease, 
      String? medicineName, 
      String? qty, 
      String? expDate, 
      String? unit, 
      dynamic safeForPregnent, 
      dynamic description, 
      String? createdAt, 
      List<ShaduleData>? shaduleData,}){
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
    _shaduleData = shaduleData;
}

  MedicineDate.fromJson(dynamic json) {
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
    if (json['shadule_data'] != null) {
      _shaduleData = [];
      json['shadule_data'].forEach((v) {
        _shaduleData?.add(ShaduleData.fromJson(v));
      });
    }
  }
  String? _id;
  String? _medicineType;
  String? _medicineId;
  String? _disease;
  String? _medicineName;
  String? _qty;
  String? _expDate;
  String? _unit;
  dynamic _safeForPregnent;
  dynamic _description;
  String? _createdAt;
  List<ShaduleData>? _shaduleData;
  MedicineDate copyWith({  String? id,
  String? medicineType,
  String? medicineId,
  String? disease,
  String? medicineName,
  String? qty,
  String? expDate,
  String? unit,
  dynamic safeForPregnent,
  dynamic description,
  String? createdAt,
  List<ShaduleData>? shaduleData,
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
  shaduleData: shaduleData ?? _shaduleData,
);
  String? get id => _id;
  String? get medicineType => _medicineType;
  String? get medicineId => _medicineId;
  String? get disease => _disease;
  String? get medicineName => _medicineName;
  String? get qty => _qty;
  String? get expDate => _expDate;
  String? get unit => _unit;
  dynamic get safeForPregnent => _safeForPregnent;
  dynamic get description => _description;
  String? get createdAt => _createdAt;
  List<ShaduleData>? get shaduleData => _shaduleData;

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
    if (_shaduleData != null) {
      map['shadule_data'] = _shaduleData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "10"
/// medicine_id : "123"
/// category : "15"
/// body_weight : "ttt"
/// dose : "chcgfgcg"
/// medicine_unit : "ML"
/// created_at : "2023-12-23 18:52:14"

class ShaduleData {
  ShaduleData({
      String? id, 
      String? medicineId, 
      String? category, 
      String? bodyWeight, 
      String? dose, 
      String? medicineUnit, 
      String? createdAt,}){
    _id = id;
    _medicineId = medicineId;
    _category = category;
    _bodyWeight = bodyWeight;
    _dose = dose;
    _medicineUnit = medicineUnit;
    _createdAt = createdAt;
}

  ShaduleData.fromJson(dynamic json) {
    _id = json['id'];
    _medicineId = json['medicine_id'];
    _category = json['category'];
    _bodyWeight = json['body_weight'];
    _dose = json['dose'];
    _medicineUnit = json['medicine_unit'];
    _createdAt = json['created_at'];
  }
  String? _id;
  String? _medicineId;
  String? _category;
  String? _bodyWeight;
  String? _dose;
  String? _medicineUnit;
  String? _createdAt;
ShaduleData copyWith({  String? id,
  String? medicineId,
  String? category,
  String? bodyWeight,
  String? dose,
  String? medicineUnit,
  String? createdAt,
}) => ShaduleData(  id: id ?? _id,
  medicineId: medicineId ?? _medicineId,
  category: category ?? _category,
  bodyWeight: bodyWeight ?? _bodyWeight,
  dose: dose ?? _dose,
  medicineUnit: medicineUnit ?? _medicineUnit,
  createdAt: createdAt ?? _createdAt,
);
  String? get id => _id;
  String? get medicineId => _medicineId;
  String? get category => _category;
  String? get bodyWeight => _bodyWeight;
  String? get dose => _dose;
  String? get medicineUnit => _medicineUnit;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['medicine_id'] = _medicineId;
    map['category'] = _category;
    map['body_weight'] = _bodyWeight;
    map['dose'] = _dose;
    map['medicine_unit'] = _medicineUnit;
    map['created_at'] = _createdAt;
    return map;
  }

}