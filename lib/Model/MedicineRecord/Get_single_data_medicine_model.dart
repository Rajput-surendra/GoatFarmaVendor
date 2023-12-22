/// error : false
/// message : "Record Get Sucessfully !"
/// data : {"id":"10","tag_id":"MD102","cat_id":"15","birth_date":"21-10-2023","weight":"2.5","age":"2 months","breed":"Goat"}

class GetSingleDataMedicineModel {
  GetSingleDataMedicineModel({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GetSingleDataMedicineModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
GetSingleDataMedicineModel copyWith({  bool? error,
  String? message,
  Data? data,
}) => GetSingleDataMedicineModel(  error: error ?? _error,
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

/// id : "10"
/// tag_id : "MD102"
/// cat_id : "15"
/// birth_date : "21-10-2023"
/// weight : "2.5"
/// age : "2 months"
/// breed : "Goat"

class Data {
  Data({
      String? id, 
      String? tagId, 
      String? catId, 
      String? birthDate, 
      String? weight, 
      String? age, 
      String? breed,}){
    _id = id;
    _tagId = tagId;
    _catId = catId;
    _birthDate = birthDate;
    _weight = weight;
    _age = age;
    _breed = breed;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _tagId = json['tag_id'];
    _catId = json['cat_id'];
    _birthDate = json['birth_date'];
    _weight = json['weight'];
    _age = json['age'];
    _breed = json['breed'];
  }
  String? _id;
  String? _tagId;
  String? _catId;
  String? _birthDate;
  String? _weight;
  String? _age;
  String? _breed;
Data copyWith({  String? id,
  String? tagId,
  String? catId,
  String? birthDate,
  String? weight,
  String? age,
  String? breed,
}) => Data(  id: id ?? _id,
  tagId: tagId ?? _tagId,
  catId: catId ?? _catId,
  birthDate: birthDate ?? _birthDate,
  weight: weight ?? _weight,
  age: age ?? _age,
  breed: breed ?? _breed,
);
  String? get id => _id;
  String? get tagId => _tagId;
  String? get catId => _catId;
  String? get birthDate => _birthDate;
  String? get weight => _weight;
  String? get age => _age;
  String? get breed => _breed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['tag_id'] = _tagId;
    map['cat_id'] = _catId;
    map['birth_date'] = _birthDate;
    map['weight'] = _weight;
    map['age'] = _age;
    map['breed'] = _breed;
    return map;
  }

}