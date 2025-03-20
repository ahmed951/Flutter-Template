class UsersModel {
  int? statusCode;
  List<Data>? data;

  UsersModel({this.statusCode, this.data});

  UsersModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? userName;
  String? userCode;
  String? nationality;
  int? sapSalesManCode;
  String? imagePath;
  bool? isActive;
  int? customerId;
  List<String>? roles;

  Data({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.userName,
    this.userCode,
    this.nationality,
    this.sapSalesManCode,
    this.imagePath,
    this.isActive,
    this.customerId,
    this.roles,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    userCode = json['userCode'];
    nationality = json['nationality'];
    sapSalesManCode = json['sapSalesManCode'];
    imagePath = json['imagePath'];
    isActive = json['isActive'];
    customerId = json['customerId'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['userName'] = userName;
    data['userCode'] = userCode;
    data['nationality'] = nationality;
    data['sapSalesManCode'] = sapSalesManCode;
    data['imagePath'] = imagePath;
    data['isActive'] = isActive;
    data['customerId'] = customerId;
    data['roles'] = roles;
    return data;
  }
}
