class TransporterModel {
  int? statusCode;
  List<Data>? data;

  TransporterModel({this.statusCode, this.data});

  TransporterModel.fromJson(Map<String, dynamic> json) {
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
  String? sapB1Id;
  List<Vehicles>? vehicles;
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
      this.sapB1Id,
      this.vehicles,
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
    sapB1Id = json['sapB1Id'];
    if (json['vehicles'] != null) {
      vehicles = <Vehicles>[];
      json['vehicles'].forEach((v) {
        vehicles!.add(Vehicles.fromJson(v));
      });
    }
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
    data['sapB1Id'] = sapB1Id;
    if (vehicles != null) {
      data['vehicles'] = vehicles!.map((v) => v.toJson()).toList();
    }
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedBy'] = updatedBy;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    data['deletedAt'] = deletedAt;
    return data;
  }
}

class Vehicles {
  String? name;
  bool? isActive;
  String? imei;
  String? platNumber;
  String? model;
  String? manufacturer;
  String? color;
  String? license;
  String? defaultDriver;
  String? defaultDriverId;
  String? licenseNumber;
  String? vehicleKilometers;
  bool? isInternal;
  int? transporterId;
  String? transporter;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  int? id;
  String? deletedAt;

  Vehicles(
      {this.name,
      this.isActive,
      this.imei,
      this.platNumber,
      this.model,
      this.manufacturer,
      this.color,
      this.license,
      this.defaultDriver,
      this.defaultDriverId,
      this.licenseNumber,
      this.vehicleKilometers,
      this.isInternal,
      this.transporterId,
      this.transporter,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.id,
      this.deletedAt});

  Vehicles.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isActive = json['isActive'];
    imei = json['imei'];
    platNumber = json['platNumber'];
    model = json['model'];
    manufacturer = json['manufacturer'];
    color = json['color'];
    license = json['license'];
    defaultDriver = json['defaultDriver'];
    defaultDriverId = json['defaultDriverId'];
    licenseNumber = json['licenseNumber'];
    vehicleKilometers = json['vehicleKilometers'];
    isInternal = json['isInternal'];
    transporterId = json['transporterId'];
    transporter = json['transporter'];
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
    data['imei'] = imei;
    data['platNumber'] = platNumber;
    data['model'] = model;
    data['manufacturer'] = manufacturer;
    data['color'] = color;
    data['license'] = license;
    data['defaultDriver'] = defaultDriver;
    data['defaultDriverId'] = defaultDriverId;
    data['licenseNumber'] = licenseNumber;
    data['vehicleKilometers'] = vehicleKilometers;
    data['isInternal'] = isInternal;
    data['transporterId'] = transporterId;
    data['transporter'] = transporter;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedBy'] = updatedBy;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
