class UserModel {
  int? statusCode;
  Data? data;

  UserModel({this.statusCode, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
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
  Result? result;
  int? id;
  String? exception;
  int? status;
  bool? isCanceled;
  bool? isCompleted;
  bool? isCompletedSuccessfully;
  int? creationOptions;
  String? asyncState;
  bool? isFaulted;

  Data(
      {this.result,
      this.id,
      this.exception,
      this.status,
      this.isCanceled,
      this.isCompleted,
      this.isCompletedSuccessfully,
      this.creationOptions,
      this.asyncState,
      this.isFaulted});

  Data.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    id = json['id'];
    exception = json['exception'];
    status = json['status'];
    isCanceled = json['isCanceled'];
    isCompleted = json['isCompleted'];
    isCompletedSuccessfully = json['isCompletedSuccessfully'];
    creationOptions = json['creationOptions'];
    asyncState = json['asyncState'];
    isFaulted = json['isFaulted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['id'] = id;
    data['exception'] = exception;
    data['status'] = status;
    data['isCanceled'] = isCanceled;
    data['isCompleted'] = isCompleted;
    data['isCompletedSuccessfully'] = isCompletedSuccessfully;
    data['creationOptions'] = creationOptions;
    data['asyncState'] = asyncState;
    data['isFaulted'] = isFaulted;
    return data;
  }
}

class Result {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? userName;
  String? userCode;
  String? nationality;
  String? sapSalesManCode;
  String? imagePath;
  bool? isActive;
  String? customerId;
  List<String>? roles;

  Result({
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

  Result.fromJson(Map<String, dynamic> json) {
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
