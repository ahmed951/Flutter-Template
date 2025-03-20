class DriverModel {
  int? statusCode;
  List<Data>? data;

  DriverModel({this.statusCode, this.data});

  DriverModel.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastName;
  String? licenseNumber;
  String? photoUrl;
  String? identityPhotoUrl;
  String? licensePhotoUrl;
  bool? isSystemUser;
  bool? isActive;
  String? userId;
  String? userName;
  String? contactNumber;
  int? assignedVehicleId;
  String? assignedVehicleName;
  String? assignedPlateNumber;
  String? dateOfBirth;
  String? nationality;
  String? profilePhoto;
  String? identityPhoto;
  String? licensePhoto;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  String? deletedAt;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.licenseNumber,
      this.photoUrl,
      this.identityPhotoUrl,
      this.licensePhotoUrl,
      this.isSystemUser,
      this.isActive,
      this.userId,
      this.userName,
      this.contactNumber,
      this.assignedVehicleId,
      this.assignedVehicleName,
      this.assignedPlateNumber,
      this.dateOfBirth,
      this.nationality,
      this.profilePhoto,
      this.identityPhoto,
      this.licensePhoto,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    licenseNumber = json['licenseNumber'];
    photoUrl = json['photoUrl'];
    identityPhotoUrl = json['identityPhotoUrl'];
    licensePhotoUrl = json['licensePhotoUrl'];
    isSystemUser = json['isSystemUser'];
    isActive = json['isActive'];
    userId = json['userId'];
    userName = json['userName'];
    contactNumber = json['contactNumber'];
    assignedVehicleId = json['assignedVehicleId'];
    assignedVehicleName = json['assignedVehicleName'];
    assignedPlateNumber = json['assignedPlateNumber'];
    dateOfBirth = json['dateOfBirth'];
    nationality = json['nationality'];
    profilePhoto = json['profilePhoto'];
    identityPhoto = json['identityPhoto'];
    licensePhoto = json['licensePhoto'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedBy = json['updatedBy'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['licenseNumber'] = licenseNumber;
    data['photoUrl'] = photoUrl;
    data['identityPhotoUrl'] = identityPhotoUrl;
    data['licensePhotoUrl'] = licensePhotoUrl;
    data['isSystemUser'] = isSystemUser;
    data['isActive'] = isActive;
    data['userId'] = userId;
    data['userName'] = userName;
    data['contactNumber'] = contactNumber;
    data['assignedVehicleId'] = assignedVehicleId;
    data['assignedVehicleName'] = assignedVehicleName;
    data['assignedPlateNumber'] = assignedPlateNumber;
    data['dateOfBirth'] = dateOfBirth;
    data['nationality'] = nationality;
    data['profilePhoto'] = profilePhoto;
    data['identityPhoto'] = identityPhoto;
    data['licensePhoto'] = licensePhoto;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedBy'] = updatedBy;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
