/// error : true
/// message : "Register Successfully !"
/// data : {"farm_name":"Goat","username":"Harish Choudhary","mobile":"7855444477","password":"$2y$10$bG..2wVYuRmtJxLPaTq.H.djwTATIs0eYChgfTBGu.QQcoJlEvpzm"}

class RegisterUserModel {
  RegisterUserModel({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  RegisterUserModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
RegisterUserModel copyWith({  bool? error,
  String? message,
  Data? data,
}) => RegisterUserModel(  error: error ?? _error,
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

/// farm_name : "Goat"
/// username : "Harish Choudhary"
/// mobile : "7855444477"
/// password : "$2y$10$bG..2wVYuRmtJxLPaTq.H.djwTATIs0eYChgfTBGu.QQcoJlEvpzm"

class Data {
  Data({
      String? farmName, 
      String? username, 
      String? mobile, 
      String? password,}){
    _farmName = farmName;
    _username = username;
    _mobile = mobile;
    _password = password;
}

  Data.fromJson(dynamic json) {
    _farmName = json['farm_name'];
    _username = json['username'];
    _mobile = json['mobile'];
    _password = json['password'];
  }
  String? _farmName;
  String? _username;
  String? _mobile;
  String? _password;
Data copyWith({  String? farmName,
  String? username,
  String? mobile,
  String? password,
}) => Data(  farmName: farmName ?? _farmName,
  username: username ?? _username,
  mobile: mobile ?? _mobile,
  password: password ?? _password,
);
  String? get farmName => _farmName;
  String? get username => _username;
  String? get mobile => _mobile;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['farm_name'] = _farmName;
    map['username'] = _username;
    map['mobile'] = _mobile;
    map['password'] = _password;
    return map;
  }

}