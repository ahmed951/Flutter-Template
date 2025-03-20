class LoginModel {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? userName;
  String? token;
  String? imagePath;
  List<String>? roles;
  int? customerId;
  String? deviceToken;
  String? sapSalesManCode;
  List<String>? permissions;

  LoginModel(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.userName,
      this.token,
      this.imagePath,
      this.roles,
      this.customerId,
      this.deviceToken,
      this.sapSalesManCode,
      this.permissions});

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    token = json['token'];
    imagePath = json['imagePath'];
    roles = json['roles'].cast<String>();
    customerId = json['customerId'];
    deviceToken = json['deviceToken'];
    sapSalesManCode = json['sapSalesManCode'];
    permissions = json['permissions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['userName'] = userName;
    data['token'] = token;
    data['imagePath'] = imagePath;
    data['roles'] = roles;
    data['customerId'] = customerId;
    data['deviceToken'] = deviceToken;
    data['sapSalesManCode'] = sapSalesManCode;
    data['permissions'] = permissions;
    return data;
  }
}
