class CheckBreedModel {
  bool? error;
  String? message;
  String? breed;

  CheckBreedModel({this.error, this.message, this.breed});

  CheckBreedModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    breed = json['breed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    data['breed'] = this.breed;
    return data;
  }
}
