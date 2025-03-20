class FactoryModel {
  int? statusCode;
  List<Data>? data;

  FactoryModel({this.statusCode, this.data});

  FactoryModel.fromJson(Map<String, dynamic> json) {
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
  bool? isActive;
  String? code;
  String? city;
  String? cityId;
  String? defaultLoadingAgent;
  String? defaultLoadingAgentId;
  String? sapB1Id;
  List<String>? permittedUsers;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  int? id;
  String? deletedAt;

  Data(
      {this.name,
      this.isActive,
      this.code,
      this.city,
      this.cityId,
      this.defaultLoadingAgent,
      this.defaultLoadingAgentId,
      this.sapB1Id,
      this.permittedUsers,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.id,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isActive = json['isActive'];
    code = json['code'];
    city = json['city'];
    cityId = json['cityId'];
    defaultLoadingAgent = json['defaultLoadingAgent'];
    defaultLoadingAgentId = json['defaultLoadingAgentId'];
    sapB1Id = json['sapB1Id'];

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
    data['isActive'] = isActive;
    data['code'] = code;
    data['city'] = city;
    data['cityId'] = cityId;
    data['defaultLoadingAgent'] = defaultLoadingAgent;
    data['defaultLoadingAgentId'] = defaultLoadingAgentId;
    data['sapB1Id'] = sapB1Id;

    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedBy'] = updatedBy;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
