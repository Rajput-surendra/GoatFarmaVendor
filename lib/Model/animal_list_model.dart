/// error : false
/// message : "Data Get Sucessfully !"
/// total_weight : "56"
/// total_animals : "3"
/// data : [{"id":"1","user_id":"71","name":null,"cat_id":"15","sub_cat":"16","add_type":" ","tag_id":"test123","qr_code":"uploads/qrcode/657422bcee77b.png","gander":"","procurement":"Born at Farm","birth_date":"05-12-2023","birth_weight":"5","mother_id":"test23","father_id":"test43","purchase_date":"","age":"Age: 0 years, 0 months, 4 days","weight":"","image":null,"delivery_date":"","if_male":"","ready_for_sale":"No","sale_weight":"","sale_price":"","status":"Male","created_at":"2023-12-09 13:48:04"},{"id":"2","user_id":"71","name":null,"cat_id":"15","sub_cat":"16","add_type":" ","tag_id":"Test 233","qr_code":"uploads/qrcode/657423410a6b2.png","gander":"","procurement":"Born at Farm","birth_date":"05-12-2023","birth_weight":"25","mother_id":"45","father_id":"56","purchase_date":"","age":"Age: 0 years, 0 months, 4 days","weight":"","image":null,"delivery_date":"","if_male":"","ready_for_sale":"No","sale_weight":"","sale_price":"","status":"kids","created_at":"2023-12-09 13:50:17"},{"id":"3","user_id":"71","name":null,"cat_id":"0","sub_cat":"0","add_type":" ","tag_id":"t1233","qr_code":"uploads/qrcode/65742478729c6.png","gander":"","procurement":"Purchase","birth_date":"27-12-2023","birth_weight":"","mother_id":"","father_id":"","purchase_date":"06-12-2023","age":"Age: 0 years, 0 months, 17 days","weight":"25","image":null,"delivery_date":"","if_male":"","ready_for_sale":"No","sale_weight":"","sale_price":"","status":"Grower","created_at":"2023-12-09 13:55:28"},{"id":"4","user_id":"71","name":null,"cat_id":"15","sub_cat":"0","add_type":" ","tag_id":"78","qr_code":"uploads/qrcode/6574260d990cf.png","gander":"Male","procurement":"Born at Farm","birth_date":"19-12-2023","birth_weight":"","mother_id":"1234","father_id":"653","purchase_date":"","age":"Age: 0 years, 0 months, 9 days","weight":"25","image":null,"delivery_date":"","if_male":"","ready_for_sale":"Yes","sale_weight":"","sale_price":"","status":"kids","created_at":"2023-12-09 14:02:13"},{"id":"5","user_id":"71","name":null,"cat_id":"15","sub_cat":"16","add_type":" ","tag_id":"fyfyfgfg","qr_code":"uploads/qrcode/6574266eb97fd.png","gander":"Female","procurement":"Purchase","birth_date":"27-12-2023","birth_weight":"","mother_id":"","father_id":"","purchase_date":"27-12-2023","age":"Age: 0 years, 0 months, 17 days","weight":"25","image":null,"delivery_date":"","if_male":"","ready_for_sale":"No","sale_weight":"","sale_price":"","status":"kids","created_at":"2023-12-09 14:03:50"},{"id":"6","user_id":"71","name":null,"cat_id":"15","sub_cat":"16","add_type":" ","tag_id":"1234","qr_code":"uploads/qrcode/6574324e12edb.png","gander":"Male","procurement":"Born at Farm","birth_date":"13-12-2023","birth_weight":"","mother_id":"45","father_id":"56","purchase_date":"","age":"Age: 0 years, 0 months, 3 days","weight":"12","image":null,"delivery_date":"","if_male":"","ready_for_sale":"No","sale_weight":"","sale_price":"","status":"kids","created_at":"2023-12-09 14:54:30"}]

class AnimalListModel {
  AnimalListModel({
      bool? error, 
      String? message,
    dynamic totalWeight,
      int? totalAnimals,
      List<AnimalData>? data,}){
    _error = error;
    _message = message;
    _totalWeight = totalWeight;
    _totalAnimals = totalAnimals;
    _data = data;
}

  AnimalListModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _totalWeight = json['total_weight'];
    _totalAnimals = json['total_animals'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AnimalData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  dynamic _totalWeight;
  int? _totalAnimals;
  List<AnimalData>? _data;
AnimalListModel copyWith({  bool? error,
  String? message,
  dynamic totalWeight,
  int? totalAnimals,
  List<AnimalData>? data,
}) => AnimalListModel(  error: error ?? _error,
  message: message ?? _message,
  totalWeight: totalWeight ?? _totalWeight,
  totalAnimals: totalAnimals ?? _totalAnimals,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  dynamic get totalWeight => _totalWeight;
  int? get totalAnimals => _totalAnimals;
  List<AnimalData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    map['total_weight'] = _totalWeight;
    map['total_animals'] = _totalAnimals;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1"
/// user_id : "71"
/// name : null
/// cat_id : "15"
/// sub_cat : "16"
/// add_type : " "
/// tag_id : "test123"
/// qr_code : "uploads/qrcode/657422bcee77b.png"
/// gander : ""
/// procurement : "Born at Farm"
/// birth_date : "05-12-2023"
/// birth_weight : "5"
/// mother_id : "test23"
/// father_id : "test43"
/// purchase_date : ""
/// age : "Age: 0 years, 0 months, 4 days"
/// weight : ""
/// image : null
/// delivery_date : ""
/// if_male : ""
/// ready_for_sale : "No"
/// sale_weight : ""
/// sale_price : ""
/// status : "Male"
/// created_at : "2023-12-09 13:48:04"

class AnimalData {
  AnimalData({
      String? id, 
      String? userId, 
      dynamic name, 
      String? catId, 
      String? subCat, 
      String? addType, 
      String? tagId, 
      String? qrCode, 
      String? gander, 
      String? procurement, 
      String? birthDate, 
      String? birthWeight, 
      String? motherId, 
      String? fatherId, 
      String? purchaseDate, 
      String? age, 
      String? weight, 
      dynamic image, 
      String? deliveryDate, 
      String? ifMale, 
      String? readyForSale, 
      String? saleWeight, 
      String? salePrice, 
      String? status, 
      String? createdAt,}){
    _id = id;
    _userId = userId;
    _name = name;
    _catId = catId;
    _subCat = subCat;
    _addType = addType;
    _tagId = tagId;
    _qrCode = qrCode;
    _gander = gander;
    _procurement = procurement;
    _birthDate = birthDate;
    _birthWeight = birthWeight;
    _motherId = motherId;
    _fatherId = fatherId;
    _purchaseDate = purchaseDate;
    _age = age;
    _weight = weight;
    _image = image;
    _deliveryDate = deliveryDate;
    _ifMale = ifMale;
    _readyForSale = readyForSale;
    _saleWeight = saleWeight;
    _salePrice = salePrice;
    _status = status;
    _createdAt = createdAt;
}

  AnimalData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _name = json['name'];
    _catId = json['cat_id'];
    _subCat = json['sub_cat'];
    _addType = json['add_type'];
    _tagId = json['tag_id'];
    _qrCode = json['qr_code'];
    _gander = json['gander'];
    _procurement = json['procurement'];
    _birthDate = json['birth_date'];
    _birthWeight = json['birth_weight'];
    _motherId = json['mother_id'];
    _fatherId = json['father_id'];
    _purchaseDate = json['purchase_date'];
    _age = json['age'];
    _weight = json['weight'];
    _image = json['image'];
    _deliveryDate = json['delivery_date'];
    _ifMale = json['if_male'];
    _readyForSale = json['ready_for_sale'];
    _saleWeight = json['sale_weight'];
    _salePrice = json['sale_price'];
    _status = json['status'];
    _createdAt = json['created_at'];
  }
  String? _id;
  String? _userId;
  dynamic _name;
  String? _catId;
  String? _subCat;
  String? _addType;
  String? _tagId;
  String? _qrCode;
  String? _gander;
  String? _procurement;
  String? _birthDate;
  String? _birthWeight;
  String? _motherId;
  String? _fatherId;
  String? _purchaseDate;
  String? _age;
  String? _weight;
  dynamic _image;
  String? _deliveryDate;
  String? _ifMale;
  String? _readyForSale;
  String? _saleWeight;
  String? _salePrice;
  String? _status;
  String? _createdAt;
  AnimalData copyWith({  String? id,
  String? userId,
  dynamic name,
  String? catId,
  String? subCat,
  String? addType,
  String? tagId,
  String? qrCode,
  String? gander,
  String? procurement,
  String? birthDate,
  String? birthWeight,
  String? motherId,
  String? fatherId,
  String? purchaseDate,
  String? age,
  String? weight,
  dynamic image,
  String? deliveryDate,
  String? ifMale,
  String? readyForSale,
  String? saleWeight,
  String? salePrice,
  String? status,
  String? createdAt,
}) => AnimalData(  id: id ?? _id,
  userId: userId ?? _userId,
  name: name ?? _name,
  catId: catId ?? _catId,
  subCat: subCat ?? _subCat,
  addType: addType ?? _addType,
  tagId: tagId ?? _tagId,
  qrCode: qrCode ?? _qrCode,
  gander: gander ?? _gander,
  procurement: procurement ?? _procurement,
  birthDate: birthDate ?? _birthDate,
  birthWeight: birthWeight ?? _birthWeight,
  motherId: motherId ?? _motherId,
  fatherId: fatherId ?? _fatherId,
  purchaseDate: purchaseDate ?? _purchaseDate,
  age: age ?? _age,
  weight: weight ?? _weight,
  image: image ?? _image,
  deliveryDate: deliveryDate ?? _deliveryDate,
  ifMale: ifMale ?? _ifMale,
  readyForSale: readyForSale ?? _readyForSale,
  saleWeight: saleWeight ?? _saleWeight,
  salePrice: salePrice ?? _salePrice,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
);
  String? get id => _id;
  String? get userId => _userId;
  dynamic get name => _name;
  String? get catId => _catId;
  String? get subCat => _subCat;
  String? get addType => _addType;
  String? get tagId => _tagId;
  String? get qrCode => _qrCode;
  String? get gander => _gander;
  String? get procurement => _procurement;
  String? get birthDate => _birthDate;
  String? get birthWeight => _birthWeight;
  String? get motherId => _motherId;
  String? get fatherId => _fatherId;
  String? get purchaseDate => _purchaseDate;
  String? get age => _age;
  String? get weight => _weight;
  dynamic get image => _image;
  String? get deliveryDate => _deliveryDate;
  String? get ifMale => _ifMale;
  String? get readyForSale => _readyForSale;
  String? get saleWeight => _saleWeight;
  String? get salePrice => _salePrice;
  String? get status => _status;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['name'] = _name;
    map['cat_id'] = _catId;
    map['sub_cat'] = _subCat;
    map['add_type'] = _addType;
    map['tag_id'] = _tagId;
    map['qr_code'] = _qrCode;
    map['gander'] = _gander;
    map['procurement'] = _procurement;
    map['birth_date'] = _birthDate;
    map['birth_weight'] = _birthWeight;
    map['mother_id'] = _motherId;
    map['father_id'] = _fatherId;
    map['purchase_date'] = _purchaseDate;
    map['age'] = _age;
    map['weight'] = _weight;
    map['image'] = _image;
    map['delivery_date'] = _deliveryDate;
    map['if_male'] = _ifMale;
    map['ready_for_sale'] = _readyForSale;
    map['sale_weight'] = _saleWeight;
    map['sale_price'] = _salePrice;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    return map;
  }

}