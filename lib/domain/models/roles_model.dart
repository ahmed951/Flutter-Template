class RolesModel {
  int? statusCode;
  Data? data;

  RolesModel({this.statusCode, this.data});

  RolesModel.fromJson(Map<String, dynamic> json) {
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
  List<Result>? result;
  int? id;
  int? status;
  bool? isCanceled;
  bool? isCompleted;
  bool? isCompletedSuccessfully;
  int? creationOptions;
  bool? isFaulted;

  Data(
      {this.result,
      this.id,
      this.status,
      this.isCanceled,
      this.isCompleted,
      this.isCompletedSuccessfully,
      this.creationOptions,
      this.isFaulted});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    id = json['id'];
    status = json['status'];
    isCanceled = json['isCanceled'];
    isCompleted = json['isCompleted'];
    isCompletedSuccessfully = json['isCompletedSuccessfully'];
    creationOptions = json['creationOptions'];
    isFaulted = json['isFaulted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['status'] = status;
    data['isCanceled'] = isCanceled;
    data['isCompleted'] = isCompleted;
    data['isCompletedSuccessfully'] = isCompletedSuccessfully;
    data['creationOptions'] = creationOptions;
    data['isFaulted'] = isFaulted;
    return data;
  }
}

class Result {
  String? arabicName;
  int? userType;
  String? id;
  String? name;
  String? normalizedName;
  String? concurrencyStamp;

  Result(
      {this.arabicName,
      this.userType,
      this.id,
      this.name,
      this.normalizedName,
      this.concurrencyStamp});

  Result.fromJson(Map<String, dynamic> json) {
    arabicName = json['arabicName'];
    userType = json['userType'];
    id = json['id'];
    name = json['name'];
    normalizedName = json['normalizedName'];
    concurrencyStamp = json['concurrencyStamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['arabicName'] = arabicName;
    data['userType'] = userType;
    data['id'] = id;
    data['name'] = name;
    data['normalizedName'] = normalizedName;
    data['concurrencyStamp'] = concurrencyStamp;
    return data;
  }
}
