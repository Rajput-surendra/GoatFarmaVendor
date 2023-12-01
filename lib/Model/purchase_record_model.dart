class PurchaseRecordModel {
  bool? error;
  String? message;
  List<PurchaseListData>? data;

  PurchaseRecordModel({this.error, this.message, this.data});

  PurchaseRecordModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PurchaseListData>[];
      json['data'].forEach((v) {
        data!.add(new PurchaseListData.fromJson(v));
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

class PurchaseListData {
  String? id;
  String? invoiceNo;
  String? date;
  String? partyName;
  String? mobile;
  String? purchaseCategory;
  String? materialDesc;
  String? qty;
  String? price;
  String? image;
  String? remark;
  String? createdAt;

  PurchaseListData(
      {this.id,
        this.invoiceNo,
        this.date,
        this.partyName,
        this.mobile,
        this.purchaseCategory,
        this.materialDesc,
        this.qty,
        this.price,
        this.image,
        this.remark,
        this.createdAt});

  PurchaseListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoiceNo = json['invoice_no'];
    date = json['date'];
    partyName = json['party_name'];
    mobile = json['mobile'];
    purchaseCategory = json['purchase_category'];
    materialDesc = json['material_desc'];
    qty = json['qty'];
    price = json['price'];
    image = json['image'];
    remark = json['remark'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['invoice_no'] = this.invoiceNo;
    data['date'] = this.date;
    data['party_name'] = this.partyName;
    data['mobile'] = this.mobile;
    data['purchase_category'] = this.purchaseCategory;
    data['material_desc'] = this.materialDesc;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['image'] = this.image;
    data['remark'] = this.remark;
    data['created_at'] = this.createdAt;
    return data;
  }
}
