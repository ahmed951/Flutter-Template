class ProductsModel {
  int? statusCode;
  List<Data>? data;

  ProductsModel({this.statusCode, this.data});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? nameAr;
  String? type;
  bool? status;
  String? sapUoM;
  double? salesVatPercentage;
  String? code;
  double? quantity;
  double? price;
  String? imagePath;
  String? productUrl;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  int? id;
  String? deletedAt;

  Data(
      {this.name,
      this.nameAr,
      this.type,
      this.status,
      this.sapUoM,
      this.salesVatPercentage,
      this.code,
      this.quantity,
      this.price,
      this.imagePath,
      this.productUrl,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.id,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nameAr = json['nameAr'];
    type = json['type'];
    status = json['status'];
    sapUoM = json['sapUoM'];
    salesVatPercentage = json['salesVatPercentage'];
    code = json['code'];
    quantity = json['quantity'];
    price = json['price'];
    imagePath = json['imagePath'];
    productUrl = json['productUrl'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedBy = json['updatedBy'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['nameAr'] = nameAr;
    data['type'] = type;
    data['status'] = status;
    data['sapUoM'] = sapUoM;
    data['salesVatPercentage'] = salesVatPercentage;
    data['code'] = code;
    data['quantity'] = quantity;
    data['price'] = price;
    data['imagePath'] = imagePath;
    data['productUrl'] = productUrl;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedBy'] = updatedBy;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
