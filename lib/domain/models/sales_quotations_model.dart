class SalesQuotationsModel {
  int? statusCode;
  List<Data>? data;

  SalesQuotationsModel({this.statusCode, this.data});

  SalesQuotationsModel.fromJson(Map<String, dynamic> json) {
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
  String? transactionNumber;
  String? customerName;
  String? customerCode;
  num? customerCreditLimit;
  double? customerCurrentBalance;
  int? customerId;
  String? factoryName;
  String? factoryCode;
  int? factoryId;
  String? transactionDate;
  int? status;
  String? salesManName;
  String? salesManId;
  String? customerNote;
  bool? isFactoryDelivery;
  num? vatPercentage;
  double? vatAmount;
  num? totalBeforeVAT;
  double? total;
  String? parentSalesQuotationId;
  String? workflowId;
  String? workflowStatusId;
  List<SalesQuotationLines>? salesQuotationLines;
  List<DocumentAttachments>? documentAttachments;
  List<CustomerAddresses>? customerAddresses;
  String? notes;
  List<String>? priceInfoList;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  String? deletedAt;

  Data(
      {this.id,
      this.transactionNumber,
      this.customerName,
      this.customerCode,
      this.customerCreditLimit,
      this.customerCurrentBalance,
      this.customerId,
      this.factoryName,
      this.factoryCode,
      this.factoryId,
      this.transactionDate,
      this.status,
      this.salesManName,
      this.salesManId,
      this.customerNote,
      this.isFactoryDelivery,
      this.vatPercentage,
      this.vatAmount,
      this.totalBeforeVAT,
      this.total,
      this.parentSalesQuotationId,
      this.workflowId,
      this.workflowStatusId,
      this.salesQuotationLines,
      this.documentAttachments,
      this.customerAddresses,
      this.notes,
      this.priceInfoList,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionNumber = json['transactionNumber'];
    customerName = json['customerName'];
    customerCode = json['customerCode'];
    customerCreditLimit = json['customerCreditLimit'];
    customerCurrentBalance = json['customerCurrentBalance'];
    customerId = json['customerId'];
    factoryName = json['factoryName'];
    factoryCode = json['factoryCode'];
    factoryId = json['factoryId'];
    transactionDate = json['transactionDate'];
    status = json['status'];
    salesManName = json['salesManName'];
    salesManId = json['salesManId'];
    customerNote = json['customerNote'];
    isFactoryDelivery = json['isFactoryDelivery'];
    vatPercentage = json['vatPercentage'];
    vatAmount = json['vatAmount'];
    totalBeforeVAT = json['totalBeforeVAT'];
    total = json['total'];
    parentSalesQuotationId = json['parentSalesQuotationId'];
    workflowId = json['workflowId'];
    workflowStatusId = json['workflowStatusId'];
    if (json['salesQuotationLines'] != null) {
      salesQuotationLines = <SalesQuotationLines>[];
      json['salesQuotationLines'].forEach((v) {
        salesQuotationLines!.add(SalesQuotationLines.fromJson(v));
      });
    }
    if (json['documentAttachments'] != null) {
      documentAttachments = <DocumentAttachments>[];
      json['documentAttachments'].forEach((v) {
        documentAttachments!.add(DocumentAttachments.fromJson(v));
      });
    }
    if (json['customerAddresses'] != null) {
      customerAddresses = <CustomerAddresses>[];
      json['customerAddresses'].forEach((v) {
        customerAddresses!.add(CustomerAddresses.fromJson(v));
      });
    }
    notes = json['notes'];
    priceInfoList = json['priceInfoList'].cast<String>();
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedBy = json['updatedBy'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transactionNumber'] = transactionNumber;
    data['customerName'] = customerName;
    data['customerCode'] = customerCode;
    data['customerCreditLimit'] = customerCreditLimit;
    data['customerCurrentBalance'] = customerCurrentBalance;
    data['customerId'] = customerId;
    data['factoryName'] = factoryName;
    data['factoryCode'] = factoryCode;
    data['factoryId'] = factoryId;
    data['transactionDate'] = transactionDate;
    data['status'] = status;
    data['salesManName'] = salesManName;
    data['salesManId'] = salesManId;
    data['customerNote'] = customerNote;
    data['isFactoryDelivery'] = isFactoryDelivery;
    data['vatPercentage'] = vatPercentage;
    data['vatAmount'] = vatAmount;
    data['totalBeforeVAT'] = totalBeforeVAT;
    data['total'] = total;
    data['parentSalesQuotationId'] = parentSalesQuotationId;
    data['workflowId'] = workflowId;
    data['workflowStatusId'] = workflowStatusId;
    if (salesQuotationLines != null) {
      data['salesQuotationLines'] =
          salesQuotationLines!.map((v) => v.toJson()).toList();
    }
    if (documentAttachments != null) {
      data['documentAttachments'] =
          documentAttachments!.map((v) => v.toJson()).toList();
    }
    if (customerAddresses != null) {
      data['customerAddresses'] =
          customerAddresses!.map((v) => v.toJson()).toList();
    }
    data['notes'] = notes;
    data['priceInfoList'] = priceInfoList;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedBy'] = updatedBy;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}

class SalesQuotationLines {
  int? id;
  int? salesQuotationId;
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemCode;
  num? quantity;
  String? uom;
  num? unitPrice;
  double? unitPriceWithTax;
  num? vatPercentage;
  double? vatAmount;
  num? totalBeforeVat;
  double? total;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  String? deletedAt;

  SalesQuotationLines(
      {this.id,
      this.salesQuotationId,
      this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemCode,
      this.quantity,
      this.uom,
      this.unitPrice,
      this.unitPriceWithTax,
      this.vatPercentage,
      this.vatAmount,
      this.totalBeforeVat,
      this.total,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.deletedAt});

  SalesQuotationLines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    salesQuotationId = json['salesQuotationId'];
    itemId = json['itemId'];
    itemName = json['itemName'];
    itemNameAr = json['itemNameAr'];
    itemCode = json['itemCode'];
    quantity = json['quantity'];
    uom = json['uom'];
    unitPrice = json['unitPrice'];
    unitPriceWithTax = json['unitPriceWithTax'];
    vatPercentage = json['vatPercentage'];
    vatAmount = json['vatAmount'];
    totalBeforeVat = json['totalBeforeVat'];
    total = json['total'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedBy = json['updatedBy'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['salesQuotationId'] = salesQuotationId;
    data['itemId'] = itemId;
    data['itemName'] = itemName;
    data['itemNameAr'] = itemNameAr;
    data['itemCode'] = itemCode;
    data['quantity'] = quantity;
    data['uom'] = uom;
    data['unitPrice'] = unitPrice;
    data['unitPriceWithTax'] = unitPriceWithTax;
    data['vatPercentage'] = vatPercentage;
    data['vatAmount'] = vatAmount;
    data['totalBeforeVat'] = totalBeforeVat;
    data['total'] = total;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedBy'] = updatedBy;
    data['updatedAt'] = updatedAt;
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

  CustomerAddresses(
      {this.id,
      this.name,
      this.country,
      this.city,
      this.street,
      this.address,
      this.location});

  CustomerAddresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    city = json['city'];
    street = json['street'];
    address = json['address'];
    location = json['location'];
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
    return data;
  }
}

class DocumentAttachments {
  int? documentId;
  int? documentType;
  String? filename;
  String? path;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  int? id;
  String? deletedAt;

  DocumentAttachments(
      {this.documentId,
      this.documentType,
      this.filename,
      this.path,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.id,
      this.deletedAt});

  DocumentAttachments.fromJson(Map<String, dynamic> json) {
    documentId = json['documentId'];
    documentType = json['documentType'];
    filename = json['filename'];
    path = json['path'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedBy = json['updatedBy'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['documentId'] = documentId;
    data['documentType'] = documentType;
    data['filename'] = filename;
    data['path'] = path;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedBy'] = updatedBy;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
