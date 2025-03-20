class PurchaseOrdersModel {
  int? statusCode;
  List<Data>? data;

  PurchaseOrdersModel({this.statusCode, this.data});

  PurchaseOrdersModel.fromJson(Map<String, dynamic> json) {
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
  int? customerId;
  num? customerCreditLimit;
  double? customerCurrentBalance;
  String? factoryName;
  String? factoryCode;
  int? factoryId;
  String? transactionDate;
  int? status;
  String? salesManName;
  String? salesManId;
  num? vatPercentage;
  double? vatAmount;
  num? totalBeforeVAT;
  double? total;
  String? notes;
  int? workflowId;
  String? workflowStatusId;
  List<PurchaseOrderLines>? purchaseOrderLines;
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
      this.customerCode,
      this.customerId,
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
      this.notes,
      this.workflowId,
      this.workflowStatusId,
      this.purchaseOrderLines,
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
    customerCode = json['customerCode'];
    customerId = json['customerId'];
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
    notes = json['notes'];
    workflowId = json['workflowId'];
    workflowStatusId = json['workflowStatusId'];
    if (json['purchaseOrderLines'] != null) {
      purchaseOrderLines = <PurchaseOrderLines>[];
      json['purchaseOrderLines'].forEach((v) {
        purchaseOrderLines!.add(PurchaseOrderLines.fromJson(v));
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
    data['customerCode'] = customerCode;
    data['customerId'] = customerId;
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
    data['notes'] = notes;
    data['workflowId'] = workflowId;
    data['workflowStatusId'] = workflowStatusId;
    if (purchaseOrderLines != null) {
      data['purchaseOrderLines'] =
          purchaseOrderLines!.map((v) => v.toJson()).toList();
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

class PurchaseOrderLines {
  int? id;
  int? purchaseOrderId;
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemCode;
  num? quantity;
  num? avliableQuantity;
  num? postedQuantity;
  String? uom;
  num? unitPrice;
  double? unitPriceWithTax;
  num? vatPercentage;
  double? vatAmount;
  num? totalBeforeVat;
  double? total;
  int? parentSalesQuotationLineId;
  String? parentSalesQuotationId;
  String? parentSalesQuotationRefNumber;
  int? customerAddressId;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  String? deletedAt;

  PurchaseOrderLines(
      {this.id,
      this.purchaseOrderId,
      this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemCode,
      this.quantity,
      this.avliableQuantity,
      this.postedQuantity,
      this.uom,
      this.unitPrice,
      this.unitPriceWithTax,
      this.vatPercentage,
      this.vatAmount,
      this.totalBeforeVat,
      this.total,
      this.parentSalesQuotationLineId,
      this.parentSalesQuotationId,
      this.parentSalesQuotationRefNumber,
      this.customerAddressId,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.deletedAt});

  PurchaseOrderLines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    purchaseOrderId = json['purchaseOrderId'];
    itemId = json['itemId'];
    itemName = json['itemName'];
    itemNameAr = json['itemNameAr'];
    itemCode = json['itemCode'];
    quantity = json['quantity'];
    avliableQuantity = json['avliableQuantity'];
    postedQuantity = json['postedQuantity'];
    uom = json['uom'];
    unitPrice = json['unitPrice'];
    unitPriceWithTax = json['unitPriceWithTax'];
    vatPercentage = json['vatPercentage'];
    vatAmount = json['vatAmount'];
    totalBeforeVat = json['totalBeforeVat'];
    total = json['total'];
    parentSalesQuotationLineId = json['parentSalesQuotationLineId'];
    parentSalesQuotationId = json['parentSalesQuotationId'];
    parentSalesQuotationRefNumber = json['parentSalesQuotationRefNumber'];
    customerAddressId = json['customerAddressId'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedBy = json['updatedBy'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['purchaseOrderId'] = purchaseOrderId;
    data['itemId'] = itemId;
    data['itemName'] = itemName;
    data['itemNameAr'] = itemNameAr;
    data['itemCode'] = itemCode;
    data['quantity'] = quantity;
    data['avliableQuantity'] = avliableQuantity;
    data['postedQuantity'] = postedQuantity;
    data['uom'] = uom;
    data['unitPrice'] = unitPrice;
    data['unitPriceWithTax'] = unitPriceWithTax;
    data['vatPercentage'] = vatPercentage;
    data['vatAmount'] = vatAmount;
    data['totalBeforeVat'] = totalBeforeVat;
    data['total'] = total;
    data['parentSalesQuotationLineId'] = parentSalesQuotationLineId;
    data['parentSalesQuotationId'] = parentSalesQuotationId;
    data['parentSalesQuotationRefNumber'] = parentSalesQuotationRefNumber;
    data['customerAddressId'] = customerAddressId;
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
