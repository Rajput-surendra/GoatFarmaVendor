import 'dart:convert';

UserTypeModel userTypeModelFromJson(String str) => UserTypeModel.fromJson(json.decode(str));

String userTypeModelToJson(UserTypeModel data) => json.encode(data.toJson());

class UserTypeModel {
  bool? error;
  String? message;
  List<Usertypedata>? data;

  UserTypeModel({
     this.error,
    this.message,
     this.data,
  });

  factory UserTypeModel.fromJson(Map<String, dynamic> json) => UserTypeModel(
    error: json["error"],
    message: json["message"],
    data: List<Usertypedata>.from(json["data"].map((x) => Usertypedata.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Usertypedata {
  String? id;
  String? role;
  String? title;

  Usertypedata({
     this.id,
     this.role,
     this.title,
  });

  factory Usertypedata.fromJson(Map<String, dynamic> json) => Usertypedata(
    id: json["id"],
    role: json["role"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "role": role,
    "title": title,
  };
}