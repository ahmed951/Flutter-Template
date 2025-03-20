class CustomerModel {
  int? statusCode;
  Data? data;

  CustomerModel({this.statusCode, this.data});

  CustomerModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? nameEn;
  String? code;
  int? groupCode;
  String? customerGroup;
  int? customerGroupId;
  String? type;
  num? creditLimit;
  double? currentAccountBalance;
  double? openDeliveryNotesBalance;
  String? zipCode;
  String? emailAddress;
  String? addressName;
  String? street;
  String? city;
  int? cityId;
  String? buildingNumber;
  String? country;
  String? googleLocation;
  String? activityLogs;
  bool? isActive;
  String? mobileNumber;
  String? notes;
  int? sapSalesPersonCode;
  List<CustomerAddresses>? customerAddresses;
  String? portalUsers;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  int? id;
  String? deletedAt;

  Data(
      {this.name,
      this.nameEn,
      this.code,
      this.groupCode,
      this.customerGroup,
      this.customerGroupId,
      this.type,
      this.creditLimit,
      this.currentAccountBalance,
      this.openDeliveryNotesBalance,
      this.zipCode,
      this.emailAddress,
      this.addressName,
      this.street,
      this.city,
      this.cityId,
      this.buildingNumber,
      this.country,
      this.googleLocation,
      this.activityLogs,
      this.isActive,
      this.mobileNumber,
      this.notes,
      this.sapSalesPersonCode,
      this.customerAddresses,
      this.portalUsers,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.id,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nameEn = json['nameEn'];
    code = json['code'];
    groupCode = json['groupCode'];
    customerGroup = json['customerGroup'];
    customerGroupId = json['customerGroupId'];
    type = json['type'];
    creditLimit = json['creditLimit'];
    currentAccountBalance = json['currentAccountBalance'];
    openDeliveryNotesBalance = json['openDeliveryNotesBalance'];
    zipCode = json['zipCode'];
    emailAddress = json['emailAddress'];
    addressName = json['addressName'];
    street = json['street'];
    city = json['city'];
    cityId = json['cityId'];
    buildingNumber = json['buildingNumber'];
    country = json['country'];
    googleLocation = json['googleLocation'];
    activityLogs = json['activityLogs'];
    isActive = json['isActive'];
    mobileNumber = json['mobileNumber'];
    notes = json['notes'];
    sapSalesPersonCode = json['sapSalesPersonCode'];
    if (json['customerAddresses'] != null) {
      customerAddresses = <CustomerAddresses>[];
      json['customerAddresses'].forEach((v) {
        customerAddresses!.add(CustomerAddresses.fromJson(v));
      });
    }
    portalUsers = json['portalUsers'];
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
    data['nameEn'] = nameEn;
    data['code'] = code;
    data['groupCode'] = groupCode;
    data['customerGroup'] = customerGroup;
    data['customerGroupId'] = customerGroupId;
    data['type'] = type;
    data['creditLimit'] = creditLimit;
    data['currentAccountBalance'] = currentAccountBalance;
    data['openDeliveryNotesBalance'] = openDeliveryNotesBalance;
    data['zipCode'] = zipCode;
    data['emailAddress'] = emailAddress;
    data['addressName'] = addressName;
    data['street'] = street;
    data['city'] = city;
    data['cityId'] = cityId;
    data['buildingNumber'] = buildingNumber;
    data['country'] = country;
    data['googleLocation'] = googleLocation;
    data['activityLogs'] = activityLogs;
    data['isActive'] = isActive;
    data['mobileNumber'] = mobileNumber;
    data['notes'] = notes;
    data['sapSalesPersonCode'] = sapSalesPersonCode;
    if (customerAddresses != null) {
      data['customerAddresses'] =
          customerAddresses!.map((v) => v.toJson()).toList();
    }
    data['portalUsers'] = portalUsers;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedBy'] = updatedBy;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    data['deletedAt'] = deletedAt;
    return data;
  }
}

class CustomerAddresses {
  int? id;
  String? name;
  String? country;
  String? city;
  String? street;
  String? address;
  String? location;
  String? customer;
  int? customerId;
  String? salesQuotations;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  String? deletedAt;

  CustomerAddresses(
      {this.id,
      this.name,
      this.country,
      this.city,
      this.street,
      this.address,
      this.location,
      this.customer,
      this.customerId,
      this.salesQuotations,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.deletedAt});

  CustomerAddresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    city = json['city'];
    street = json['street'];
    address = json['address'];
    location = json['location'];
    customer = json['customer'];
    customerId = json['customerId'];
    salesQuotations = json['salesQuotations'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedBy = json['updatedBy'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country'] = country;
    data['city'] = city;
    data['street'] = street;
    data['address'] = address;
    data['location'] = location;
    data['customer'] = customer;
    data['customerId'] = customerId;
    data['salesQuotations'] = salesQuotations;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedBy'] = updatedBy;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
