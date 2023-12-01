class AnimalCount {
  bool? error;
  String? message;
  String? totalAnimals;
  String? totalMale;
  String? totalFemale;
  String? totalBreeder;
  String? totalPregnant;

  AnimalCount(
      {this.error,
        this.message,
        this.totalAnimals,
        this.totalMale,
        this.totalFemale,
        this.totalBreeder,
        this.totalPregnant});

  AnimalCount.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    totalAnimals = json['total_animals'];
    totalMale = json['total_male'];
    totalFemale = json['total_female'];
    totalBreeder = json['total_breeder'];
    totalPregnant = json['total_pregnant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    data['total_animals'] = this.totalAnimals;
    data['total_male'] = this.totalMale;
    data['total_female'] = this.totalFemale;
    data['total_breeder'] = this.totalBreeder;
    data['total_pregnant'] = this.totalPregnant;
    return data;
  }
}
