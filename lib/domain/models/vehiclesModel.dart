class VehiclesModel {
  int? statusCode;
  List<Data>? data;

  VehiclesModel({this.statusCode, this.data});

  VehiclesModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  bool? isActive;
  String? platNumber;
  String? imei;
  String? model;
  String? manufacturer;
  String? color;
  String? defaultDriverId;
  String? license;
  String? licensePath;
  String? drivers;
  String? licenseNumber;
  String? vehicleKilometer;
  bool? isInternal;
  int? transporterId;
  String? defaultDriverName;
  String? transporterName;

  Data(
      {this.id,
      this.name,
      this.isActive,
      this.platNumber,
      this.imei,
      this.model,
      this.manufacturer,
      this.color,
      this.defaultDriverId,
      this.license,
      this.licensePath,
      this.drivers,
      this.licenseNumber,
      this.vehicleKilometer,
      this.isInternal,
      this.transporterId,
      this.defaultDriverName,
      this.transporterName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isActive = json['isActive'];
    platNumber = json['platNumber'];
    imei = json['imei'];
    model = json['model'];
    manufacturer = json['manufacturer'];
    color = json['color'];
    defaultDriverId = json['defaultDriverId'];
    license = json['license'];
    licensePath = json['licensePath'];
    drivers = json['drivers'];
    licenseNumber = json['licenseNumber'];
    vehicleKilometer = json['vehicleKilometer'];
    isInternal = json['isInternal'];
    transporterId = json['transporterId'];
    defaultDriverName = json['defaultDriverName'];
    transporterName = json['transporterName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['isActive'] = isActive;
    data['platNumber'] = platNumber;
    data['imei'] = imei;
    data['model'] = model;
    data['manufacturer'] = manufacturer;
    data['color'] = color;
    data['defaultDriverId'] = defaultDriverId;
    data['license'] = license;
    data['licensePath'] = licensePath;
    data['drivers'] = drivers;
    data['licenseNumber'] = licenseNumber;
    data['vehicleKilometer'] = vehicleKilometer;
    data['isInternal'] = isInternal;
    data['transporterId'] = transporterId;
    data['defaultDriverName'] = defaultDriverName;
    data['transporterName'] = transporterName;
    return data;
  }
}
