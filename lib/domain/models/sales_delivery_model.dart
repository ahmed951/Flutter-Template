class SalesDeliveryModel {
  int? statusCode;
  Data? data;

  SalesDeliveryModel({this.statusCode, this.data});

  SalesDeliveryModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? transactionNumber;
  String? customerName;
  int? customerId;
  String? customerCode;
  int? customerCreditLimit;
  int? customerCurrentBalance;
  String? factoryName;
  String? factoryCode;
  int? factoryId;
  String? transactionDate;
  int? status;
  String? salesManName;
  String? salesManId;
  int? vatPercentage;
  int? vatAmount;
  int? totalBeforeVAT;
  int? total;
  String? workflowId;
  String? workflowStatusId;
  int? parentLoadingOrderId;
  String? parentSalesOrderLineId;
  List<SalesDeliveryLines>? salesDeliveryLines;
  List<DocumentAttachments>? documentAttachments;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  String? deletedAt;

  Data(
      {this.id,
      this.transactionNumber,
      this.customerName,
      this.customerId,
      this.customerCode,
      this.customerCreditLimit,
      this.customerCurrentBalance,
      this.factoryName,
      this.factoryCode,
      this.factoryId,
      this.transactionDate,
      this.status,
      this.salesManName,
      this.salesManId,
      this.vatPercentage,
      this.vatAmount,
      this.totalBeforeVAT,
      this.total,
      this.workflowId,
      this.workflowStatusId,
      this.parentLoadingOrderId,
      this.parentSalesOrderLineId,
      this.salesDeliveryLines,
      this.documentAttachments,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionNumber = json['transactionNumber'];
    customerName = json['customerName'];
    customerId = json['customerId'];
    customerCode = json['customerCode'];
    customerCreditLimit = json['customerCreditLimit'];
    customerCurrentBalance = json['customerCurrentBalance'];
    factoryName = json['factoryName'];
    factoryCode = json['factoryCode'];
    factoryId = json['factoryId'];
    transactionDate = json['transactionDate'];
    status = json['status'];
    salesManName = json['salesManName'];
    salesManId = json['salesManId'];
    vatPercentage = json['vatPercentage'];
    vatAmount = json['vatAmount'];
    totalBeforeVAT = json['totalBeforeVAT'];
    total = json['total'];
    workflowId = json['workflowId'];
    workflowStatusId = json['workflowStatusId'];
    parentLoadingOrderId = json['parentLoadingOrderId'];
    parentSalesOrderLineId = json['parentSalesOrderLineId'];
    if (json['salesDeliveryLines'] != null) {
      salesDeliveryLines = <SalesDeliveryLines>[];
      json['salesDeliveryLines'].forEach((v) {
        salesDeliveryLines!.add(SalesDeliveryLines.fromJson(v));
      });
    }
    if (json['documentAttachments'] != null) {
      documentAttachments = <DocumentAttachments>[];
      json['documentAttachments'].forEach((v) {
        documentAttachments!.add(DocumentAttachments.fromJson(v));
      });
    }
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
    data['customerId'] = customerId;
    data['customerCode'] = customerCode;
    data['customerCreditLimit'] = customerCreditLimit;
    data['customerCurrentBalance'] = customerCurrentBalance;
    data['factoryName'] = factoryName;
    data['factoryCode'] = factoryCode;
    data['factoryId'] = factoryId;
    data['transactionDate'] = transactionDate;
    data['status'] = status;
    data['salesManName'] = salesManName;
    data['salesManId'] = salesManId;
    data['vatPercentage'] = vatPercentage;
    data['vatAmount'] = vatAmount;
    data['totalBeforeVAT'] = totalBeforeVAT;
    data['total'] = total;
    data['workflowId'] = workflowId;
    data['workflowStatusId'] = workflowStatusId;
    data['parentLoadingOrderId'] = parentLoadingOrderId;
    data['parentSalesOrderLineId'] = parentSalesOrderLineId;
    if (salesDeliveryLines != null) {
      data['salesDeliveryLines'] =
          salesDeliveryLines!.map((v) => v.toJson()).toList();
    }
    if (documentAttachments != null) {
      data['documentAttachments'] =
          documentAttachments!.map((v) => v.toJson()).toList();
    }
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedBy'] = updatedBy;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}

class SalesDeliveryLines {
  int? id;
  int? salesDeliveryId;
  int? parentSalesOrderLineId;
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemCode;
  int? quantityRequested;
  int? quantityDelivered;
  String? uom;
  int? unitPrice;
  int? unitPriceWithTax;
  int? vatPercentage;
  int? vatAmount;
  int? totalBeforeVat;
  int? total;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  String? deletedAt;

  SalesDeliveryLines(
      {this.id,
      this.salesDeliveryId,
      this.parentSalesOrderLineId,
      this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemCode,
      this.quantityRequested,
      this.quantityDelivered,
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

  SalesDeliveryLines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    salesDeliveryId = json['salesDeliveryId'];
    parentSalesOrderLineId = json['parentSalesOrderLineId'];
    itemId = json['itemId'];
    itemName = json['itemName'];
    itemNameAr = json['itemNameAr'];
    itemCode = json['itemCode'];
    quantityRequested = json['quantityRequested'];
    quantityDelivered = json['quantityDelivered'];
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
    data['salesDeliveryId'] = salesDeliveryId;
    data['parentSalesOrderLineId'] = parentSalesOrderLineId;
    data['itemId'] = itemId;
    data['itemName'] = itemName;
    data['itemNameAr'] = itemNameAr;
    data['itemCode'] = itemCode;
    data['quantityRequested'] = quantityRequested;
    data['quantityDelivered'] = quantityDelivered;
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
