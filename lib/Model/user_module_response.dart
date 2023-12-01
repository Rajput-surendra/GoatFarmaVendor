class UserModuleResponse {
  bool? error;
  String? message;
  List<UserModuleData>? data;

  UserModuleResponse({this.error, this.message, this.data});

  UserModuleResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <UserModuleData>[];
      json['data'].forEach((v) {
        data!.add(new UserModuleData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserModuleData {
  String? module;
  Permissions? permissions;

  UserModuleData({this.module, this.permissions});

  UserModuleData.fromJson(Map<String, dynamic> json) {
    module = json['module'];
    permissions = json['permissions'] != null
        ? new Permissions.fromJson(json['permissions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['module'] = this.module;
    if (this.permissions != null) {
      data['permissions'] = this.permissions!.toJson();
    }
    return data;
  }
}

class Permissions {
  String? create;

  Permissions({this.create});

  Permissions.fromJson(Map<String, dynamic> json) {
    create = json['create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['create'] = this.create;
    return data;
  }
}
