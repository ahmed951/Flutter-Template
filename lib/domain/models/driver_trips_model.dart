class DriverTripsModel {
  int? statusCode;
  Data? data;

  DriverTripsModel({this.statusCode, this.data});

  DriverTripsModel.fromJson(Map<String, dynamic> json) {
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
  int? count;
  List<Items>? items;

  Data({this.count, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String? orderNumber;
  int? customerId;
  String? customerCode;
  String? customerName;
  String? customerRefNo;
  int? factoryId;
  String? factoryName;
  String? factoryCode;
  int? customerAddressId;
  String? customerAddressName;
  String? customerAddressCountry;
  String? customerAddressCity;
  String? customerAddressAddress;
  String? customerAddressLocation;
  int? transporterId;
  String? transporterName;
  String? transactionDate;
  int? status;
  int? driverId;
  int? vehicleId;
  int? parentSalesOrderLineId;
  String? parentSalesOrderNumber;
  String? workflowId;
  String? workflowStatusId;
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemCode;
  String? itemUOM;
  num? totalRequestedQuantity;
  num? quantityAvaliableForLoading;
  num? quantity;
  num? numberOfRequests;
  String? deliveryAuthAttachmentFileName;
  String? deliveryAuthAttachmentFilePath;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  String? deletedAt;

  Items(
      {this.id,
      this.orderNumber,
      this.customerId,
      this.customerCode,
      this.customerName,
      this.customerRefNo,
      this.factoryId,
      this.factoryName,
      this.factoryCode,
      this.customerAddressId,
      this.customerAddressName,
      this.customerAddressCountry,
      this.customerAddressCity,
      this.customerAddressAddress,
      this.customerAddressLocation,
      this.transporterId,
      this.transporterName,
      this.transactionDate,
      this.status,
      this.driverId,
      this.vehicleId,
      this.parentSalesOrderLineId,
      this.parentSalesOrderNumber,
      this.workflowId,
      this.workflowStatusId,
      this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemCode,
      this.itemUOM,
      this.totalRequestedQuantity,
      this.quantityAvaliableForLoading,
      this.quantity,
      this.numberOfRequests,
      this.deliveryAuthAttachmentFileName,
      this.deliveryAuthAttachmentFilePath,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.deletedAt});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['orderNumber'];
    customerId = json['customerId'];
    customerCode = json['customerCode'];
    customerName = json['customerName'];
    customerRefNo = json['customerRefNo'];
    factoryId = json['factoryId'];
    factoryName = json['factoryName'];
    factoryCode = json['factoryCode'];
    customerAddressId = json['customerAddressId'];
    customerAddressName = json['customerAddressName'];
    customerAddressCountry = json['customerAddressCountry'];
    customerAddressCity = json['customerAddressCity'];
    customerAddressAddress = json['customerAddressAddress'];
    customerAddressLocation = json['customerAddressLocation'];
    transporterId = json['transporterId'];
    transporterName = json['transporterName'];
    transactionDate = json['transactionDate'];
    status = json['status'];
    driverId = json['driverId'];
    vehicleId = json['vehicleId'];
    parentSalesOrderLineId = json['parentSalesOrderLineId'];
    parentSalesOrderNumber = json['parentSalesOrderNumber'];
    workflowId = json['workflowId'];
    workflowStatusId = json['workflowStatusId'];
    itemId = json['itemId'];
    itemName = json['itemName'];
    itemNameAr = json['itemNameAr'];
    itemCode = json['itemCode'];
    itemUOM = json['itemUOM'];
    totalRequestedQuantity = json['totalRequestedQuantity'];
    quantityAvaliableForLoading = json['quantityAvaliableForLoading'];
    quantity = json['quantity'];
    numberOfRequests = json['numberOfRequests'];
    deliveryAuthAttachmentFileName = json['deliveryAuthAttachmentFileName'];
    deliveryAuthAttachmentFilePath = json['deliveryAuthAttachmentFilePath'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedBy = json['updatedBy'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['orderNumber'] = orderNumber;
    data['customerId'] = customerId;
    data['customerCode'] = customerCode;
    data['customerName'] = customerName;
    data['customerRefNo'] = customerRefNo;
    data['factoryId'] = factoryId;
    data['factoryName'] = factoryName;
    data['factoryCode'] = factoryCode;
    data['customerAddressId'] = customerAddressId;
    data['customerAddressName'] = customerAddressName;
    data['customerAddressCountry'] = customerAddressCountry;
    data['customerAddressCity'] = customerAddressCity;
    data['customerAddressAddress'] = customerAddressAddress;
    data['customerAddressLocation'] = customerAddressLocation;
    data['transporterId'] = transporterId;
    data['transporterName'] = transporterName;
    data['transactionDate'] = transactionDate;
    data['status'] = status;
    data['driverId'] = driverId;
    data['vehicleId'] = vehicleId;
    data['parentSalesOrderLineId'] = parentSalesOrderLineId;
    data['parentSalesOrderNumber'] = parentSalesOrderNumber;
    data['workflowId'] = workflowId;
    data['workflowStatusId'] = workflowStatusId;
    data['itemId'] = itemId;
    data['itemName'] = itemName;
    data['itemNameAr'] = itemNameAr;
    data['itemCode'] = itemCode;
    data['itemUOM'] = itemUOM;
    data['totalRequestedQuantity'] = totalRequestedQuantity;
    data['quantityAvaliableForLoading'] = quantityAvaliableForLoading;
    data['quantity'] = quantity;
    data['numberOfRequests'] = numberOfRequests;
    data['deliveryAuthAttachmentFileName'] = deliveryAuthAttachmentFileName;
    data['deliveryAuthAttachmentFilePath'] = deliveryAuthAttachmentFilePath;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedBy'] = updatedBy;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
