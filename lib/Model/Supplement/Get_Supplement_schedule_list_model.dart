/// error : false
/// message : "Record Get Sucessfully !"
/// data : [{"id":"3","status":"All","supliment_id":"Goat123","period":"one time","from_date":"23-01-2024","to_date":"27-01-2024","time":"Evening","created_at":"2024-01-23 15:57:56"},{"id":"6","status":"All","supliment_id":"5","period":"One Time","from_date":"25-01-2024","to_date":"26-01-2024","time":"06:36 PM","created_at":"2024-01-23 16:38:39"},{"id":"7","status":"All","supliment_id":"5","period":"Continues","from_date":"26-01-2024","to_date":"31-01-2024","time":"08:38 PM","created_at":"2024-01-23 16:39:33"},{"id":"8","status":"Empty","supliment_id":"5","period":"One Time","from_date":"24-01-2024","to_date":"31-01-2024","time":"07:52 PM","created_at":"2024-01-23 17:54:02"}]

class GetSupplementScheduleListModel {
  GetSupplementScheduleListModel({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GetSupplementScheduleListModel.fromJson(dynamic json) {
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
GetSupplementScheduleListModel copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => GetSupplementScheduleListModel(  error: error ?? _error,
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

/// id : "3"
/// status : "All"
/// supliment_id : "Goat123"
/// period : "one time"
/// from_date : "23-01-2024"
/// to_date : "27-01-2024"
/// time : "Evening"
/// created_at : "2024-01-23 15:57:56"

class Data {
  Data({
      String? id, 
      String? status, 
      String? suplimentId, 
      String? period, 
      String? fromDate, 
      String? toDate, 
      String? time, 
      String? createdAt,}){
    _id = id;
    _status = status;
    _suplimentId = suplimentId;
    _period = period;
    _fromDate = fromDate;
    _toDate = toDate;
    _time = time;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _status = json['status'];
    _suplimentId = json['supliment_id'];
    _period = json['period'];
    _fromDate = json['from_date'];
    _toDate = json['to_date'];
    _time = json['time'];
    _createdAt = json['created_at'];
  }
  String? _id;
  String? _status;
  String? _suplimentId;
  String? _period;
  String? _fromDate;
  String? _toDate;
  String? _time;
  String? _createdAt;
Data copyWith({  String? id,
  String? status,
  String? suplimentId,
  String? period,
  String? fromDate,
  String? toDate,
  String? time,
  String? createdAt,
}) => Data(  id: id ?? _id,
  status: status ?? _status,
  suplimentId: suplimentId ?? _suplimentId,
  period: period ?? _period,
  fromDate: fromDate ?? _fromDate,
  toDate: toDate ?? _toDate,
  time: time ?? _time,
  createdAt: createdAt ?? _createdAt,
);
  String? get id => _id;
  String? get status => _status;
  String? get suplimentId => _suplimentId;
  String? get period => _period;
  String? get fromDate => _fromDate;
  String? get toDate => _toDate;
  String? get time => _time;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['status'] = _status;
    map['supliment_id'] = _suplimentId;
    map['period'] = _period;
    map['from_date'] = _fromDate;
    map['to_date'] = _toDate;
    map['time'] = _time;
    map['created_at'] = _createdAt;
    return map;
  }

}