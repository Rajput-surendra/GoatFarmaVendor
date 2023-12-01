class AnimalListModel {
  bool? error;
  String? message;
  List<AnimalData>? data;

  AnimalListModel({this.error, this.message, this.data});

  AnimalListModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AnimalData>[];
      json['data'].forEach((v) {
        data!.add(new AnimalData.fromJson(v));
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

class AnimalData {
  String? id;
  String? userId;
  String? name;
  String? catId;
  String? subCat;
  String? tagId;
  String? qrCode;
  String? gander;
  String? procurement;
  String? birthDate;
  String? birthWeight;
  String? motherId;
  String? fatherId;
  String? purchaseDate;
  String? age;
  String? weight;
  String? image;
  String? deliveryDate;
  String? ifMale;
  String? readyForSale;
  String? saleWeight;
  String? salePrice;
  String? createdAt;

  AnimalData(
      {this.id,
        this.userId,
        this.name,
        this.catId,
        this.subCat,
        this.tagId,
        this.qrCode,
        this.gander,
        this.procurement,
        this.birthDate,
        this.birthWeight,
        this.motherId,
        this.fatherId,
        this.purchaseDate,
        this.age,
        this.weight,
        this.image,
        this.deliveryDate,
        this.ifMale,
        this.readyForSale,
        this.saleWeight,
        this.salePrice,
        this.createdAt});

  AnimalData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    catId = json['cat_id'];
    subCat = json['sub_cat'];
    tagId = json['tag_id'];
    qrCode = json['qr_code'];
    gander = json['gander'];
    procurement = json['procurement'];
    birthDate = json['birth_date'];
    birthWeight = json['birth_weight'];
    motherId = json['mother_id'];
    fatherId = json['father_id'];
    purchaseDate = json['purchase_date'];
    age = json['age'];
    weight = json['weight'];
    image = json['image'];
    deliveryDate = json['delivery_date'];
    ifMale = json['if_male'];
    readyForSale = json['ready_for_sale'];
    saleWeight = json['sale_weight'];
    salePrice = json['sale_price'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['cat_id'] = this.catId;
    data['sub_cat'] = this.subCat;
    data['tag_id'] = this.tagId;
    data['qr_code'] = this.qrCode;
    data['gander'] = this.gander;
    data['procurement'] = this.procurement;
    data['birth_date'] = this.birthDate;
    data['birth_weight'] = this.birthWeight;
    data['mother_id'] = this.motherId;
    data['father_id'] = this.fatherId;
    data['purchase_date'] = this.purchaseDate;
    data['age'] = this.age;
    data['weight'] = this.weight;
    data['image'] = this.image;
    data['delivery_date'] = this.deliveryDate;
    data['if_male'] = this.ifMale;
    data['ready_for_sale'] = this.readyForSale;
    data['sale_weight'] = this.saleWeight;
    data['sale_price'] = this.salePrice;
    data['created_at'] = this.createdAt;
    return data;
  }
}
