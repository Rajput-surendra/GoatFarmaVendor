/// error : true
/// message : "Record Get Sucessfully !"
/// data : [{"id":"2","date":null,"male_tag":"GOTN5609","male_id":"27","male_breed":null,"female_tag":"GOTN9756","female_id":"30","meating_type":"natural","breeding":"cross","meating_status":"Emty","expected_due_date":null,"dose":null,"semen":null,"nog_of_breed":null,"created_at":"2023-12-03 15:41:30","updated_at":"2023-12-04 15:13:53","age":"3","weight":"10.8","days":"5"},{"id":"3","date":null,"male_tag":"GOTN5609","male_id":"27","male_breed":null,"female_tag":"GOTN9756","female_id":"30","meating_type":"natural","breeding":"cross","meating_status":"Emty","expected_due_date":null,"dose":null,"semen":null,"nog_of_breed":null,"created_at":"2023-12-04 15:41:30","updated_at":"2023-12-04 15:15:15","age":"3","weight":"10.8","days":"4"},{"id":"4","date":null,"male_tag":"GOTN5609","male_id":"27","male_breed":null,"female_tag":"GOTN9756","female_id":"30","meating_type":"natural","breeding":"cross","meating_status":"Pregnant","expected_due_date":"08-12-2023","dose":null,"semen":null,"nog_of_breed":null,"created_at":"2023-12-04 15:49:34","updated_at":"2023-12-04 15:15:40","age":"3","weight":"10.8","days":"4"},{"id":"5","date":null,"male_tag":"GOTN5609","male_id":"27","male_breed":null,"female_tag":"GOTN9756","female_id":"30","meating_type":"natural","breeding":"cross","meating_status":"Emty","expected_due_date":"2023-12-04","dose":null,"semen":null,"nog_of_breed":null,"created_at":"2023-12-04 15:41:57","updated_at":"2023-12-04 15:16:08","age":"3","weight":"10.8","days":"4"}]

class GetMatingListModel {
  GetMatingListModel({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GetMatingListModel.fromJson(dynamic json) {
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
GetMatingListModel copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => GetMatingListModel(  error: error ?? _error,
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
/// date : null
/// male_tag : "GOTN5609"
/// male_id : "27"
/// male_breed : null
/// female_tag : "GOTN9756"
/// female_id : "30"
/// meating_type : "natural"
/// breeding : "cross"
/// meating_status : "Emty"
/// expected_due_date : null
/// dose : null
/// semen : null
/// nog_of_breed : null
/// created_at : "2023-12-03 15:41:30"
/// updated_at : "2023-12-04 15:13:53"
/// age : "3"
/// weight : "10.8"
/// days : "5"

class Data {
  Data({
      String? id, 
      dynamic date, 
      String? maleTag, 
      String? maleId, 
      dynamic maleBreed, 
      String? femaleTag, 
      String? femaleId, 
      String? meatingType, 
      String? breeding, 
      String? meatingStatus, 
      dynamic expectedDueDate, 
      dynamic dose, 
      dynamic semen, 
      dynamic nogOfBreed, 
      String? createdAt, 
      String? updatedAt, 
      String? age, 
      String? weight, 
      String? days,}){
    _id = id;
    _date = date;
    _maleTag = maleTag;
    _maleId = maleId;
    _maleBreed = maleBreed;
    _femaleTag = femaleTag;
    _femaleId = femaleId;
    _meatingType = meatingType;
    _breeding = breeding;
    _meatingStatus = meatingStatus;
    _expectedDueDate = expectedDueDate;
    _dose = dose;
    _semen = semen;
    _nogOfBreed = nogOfBreed;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _age = age;
    _weight = weight;
    _days = days;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _date = json['date'];
    _maleTag = json['male_tag'];
    _maleId = json['male_id'];
    _maleBreed = json['male_breed'];
    _femaleTag = json['female_tag'];
    _femaleId = json['female_id'];
    _meatingType = json['meating_type'];
    _breeding = json['breeding'];
    _meatingStatus = json['meating_status'];
    _expectedDueDate = json['expected_due_date'];
    _dose = json['dose'];
    _semen = json['semen'];
    _nogOfBreed = json['nog_of_breed'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _age = json['age'];
    _weight = json['weight'];
    _days = json['days'];
  }
  String? _id;
  dynamic _date;
  String? _maleTag;
  String? _maleId;
  dynamic _maleBreed;
  String? _femaleTag;
  String? _femaleId;
  String? _meatingType;
  String? _breeding;
  String? _meatingStatus;
  dynamic _expectedDueDate;
  dynamic _dose;
  dynamic _semen;
  dynamic _nogOfBreed;
  String? _createdAt;
  String? _updatedAt;
  String? _age;
  String? _weight;
  String? _days;
Data copyWith({  String? id,
  dynamic date,
  String? maleTag,
  String? maleId,
  dynamic maleBreed,
  String? femaleTag,
  String? femaleId,
  String? meatingType,
  String? breeding,
  String? meatingStatus,
  dynamic expectedDueDate,
  dynamic dose,
  dynamic semen,
  dynamic nogOfBreed,
  String? createdAt,
  String? updatedAt,
  String? age,
  String? weight,
  String? days,
}) => Data(  id: id ?? _id,
  date: date ?? _date,
  maleTag: maleTag ?? _maleTag,
  maleId: maleId ?? _maleId,
  maleBreed: maleBreed ?? _maleBreed,
  femaleTag: femaleTag ?? _femaleTag,
  femaleId: femaleId ?? _femaleId,
  meatingType: meatingType ?? _meatingType,
  breeding: breeding ?? _breeding,
  meatingStatus: meatingStatus ?? _meatingStatus,
  expectedDueDate: expectedDueDate ?? _expectedDueDate,
  dose: dose ?? _dose,
  semen: semen ?? _semen,
  nogOfBreed: nogOfBreed ?? _nogOfBreed,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  age: age ?? _age,
  weight: weight ?? _weight,
  days: days ?? _days,
);
  String? get id => _id;
  dynamic get date => _date;
  String? get maleTag => _maleTag;
  String? get maleId => _maleId;
  dynamic get maleBreed => _maleBreed;
  String? get femaleTag => _femaleTag;
  String? get femaleId => _femaleId;
  String? get meatingType => _meatingType;
  String? get breeding => _breeding;
  String? get meatingStatus => _meatingStatus;
  dynamic get expectedDueDate => _expectedDueDate;
  dynamic get dose => _dose;
  dynamic get semen => _semen;
  dynamic get nogOfBreed => _nogOfBreed;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get age => _age;
  String? get weight => _weight;
  String? get days => _days;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['date'] = _date;
    map['male_tag'] = _maleTag;
    map['male_id'] = _maleId;
    map['male_breed'] = _maleBreed;
    map['female_tag'] = _femaleTag;
    map['female_id'] = _femaleId;
    map['meating_type'] = _meatingType;
    map['breeding'] = _breeding;
    map['meating_status'] = _meatingStatus;
    map['expected_due_date'] = _expectedDueDate;
    map['dose'] = _dose;
    map['semen'] = _semen;
    map['nog_of_breed'] = _nogOfBreed;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['age'] = _age;
    map['weight'] = _weight;
    map['days'] = _days;
    return map;
  }

}