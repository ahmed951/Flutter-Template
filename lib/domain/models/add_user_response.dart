class AddUserResponse {
  int? statusCode;
  Data? data;

  AddUserResponse({this.statusCode, this.data});

  AddUserResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? email;
  String? userName;
  String? firstName;
  String? lastName;
  String? userCode;
  String? password;
  String? confirmPassword;
  List<String>? rolesString;
  String? factories;
  String? nationality;
  String? image;
  int? sapSalesManCode;

  Data(
      {this.email,
      this.userName,
      this.firstName,
      this.lastName,
      this.userCode,
      this.password,
      this.confirmPassword,
      this.rolesString,
      this.factories,
      this.nationality,
      this.image,
      this.sapSalesManCode});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userCode = json['userCode'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    rolesString = json['rolesString'].cast<String>();
    factories = json['factories'];
    nationality = json['nationality'];
    image = json['image'];
    sapSalesManCode = json['sapSalesManCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['userName'] = userName;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['userCode'] = userCode;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    data['rolesString'] = rolesString;
    data['factories'] = factories;
    data['nationality'] = nationality;
    data['image'] = image;
    data['sapSalesManCode'] = sapSalesManCode;
    return data;
  }
}
