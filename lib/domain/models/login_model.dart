class LoginModel {
  bool? success;
  int? statusCode;
  String? message;
  int? count;
  Data? data;

  LoginModel(
      {this.success, this.statusCode, this.message, this.count, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    count = json['count'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['statusCode'] = statusCode;
    data['message'] = message;
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? message;
  bool? isAuthenticated;
  String? email;
  List<String>? roles;
  String? token;
  String? refreshToken;
  String? refreshTokenExpiration;
  bool? isActive;
  bool? isEmailAuthonticated;
  int? timeZone;
  String? fullName;

  Data(
      {this.id,
      this.message,
      this.isAuthenticated,
      this.email,
      this.roles,
      this.token,
      this.refreshToken,
      this.refreshTokenExpiration,
      this.isActive,
      this.isEmailAuthonticated,
      this.timeZone,
      this.fullName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    isAuthenticated = json['isAuthenticated'];
    email = json['email'];
    roles = json['roles'].cast<String>();
    token = json['token'];
    refreshToken = json['refreshToken'];
    refreshTokenExpiration = json['refreshTokenExpiration'];
    isActive = json['isActive'];
    isEmailAuthonticated = json['isEmailAuthonticated'];
    timeZone = json['timeZone'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['isAuthenticated'] = isAuthenticated;
    data['email'] = email;
    data['roles'] = roles;
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    data['refreshTokenExpiration'] = refreshTokenExpiration;
    data['isActive'] = isActive;
    data['isEmailAuthonticated'] = isEmailAuthonticated;
    data['timeZone'] = timeZone;
    data['fullName'] = fullName;
    return data;
  }
}
