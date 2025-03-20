class OrdersModel {
  int? statusCode;
  List<Data>? data;

  OrdersModel({this.statusCode, this.data});

  OrdersModel.fromJson(Map<String, dynamic> json) {
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
  double? customerCreditLimit;
  double? customerCurrentBalance;
  String? factoryName;
  String? factoryCode;
  int? factoryId;
  String? transactionDate;
  int? status;
  String? salesManName;
  String? salesManId;
  double? vatPercentage;
  double? vatAmount;
  double? totalBeforeVAT;
  double? total;
  String? notes;
  int? workflowId;
  int? workflowStatusId;
  List<SalesOrderLines>? salesOrderLines;

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
      this.salesOrderLines,
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
    if (json['salesOrderLines'] != null) {
      salesOrderLines = <SalesOrderLines>[];
      json['salesOrderLines'].forEach((v) {
        salesOrderLines!.add(SalesOrderLines.fromJson(v));
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
    if (salesOrderLines != null) {
      data['salesOrderLines'] =
          salesOrderLines!.map((v) => v.toJson()).toList();
    }

    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedBy'] = updatedBy;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}

class SalesOrderLines {
  int? id;
  int? salesOrderId;
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemCode;
  double? quantity;
  String? uom;
  double? unitPrice;
  double? unitPriceWithTax;
  double? vatPercentage;
  double? vatAmount;
  double? totalBeforeVat;
  double? total;
  int? parentSalesQuotationId;
  int? customerAddressId;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  String? deletedAt;

  SalesOrderLines(
      {this.id,
      this.salesOrderId,
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
      this.parentSalesQuotationId,
      this.customerAddressId,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.deletedAt});

  SalesOrderLines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    salesOrderId = json['salesOrderId'];
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
    parentSalesQuotationId = json['parentSalesQuotationId'];
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
    data['salesOrderId'] = salesOrderId;
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
    data['parentSalesQuotationId'] = parentSalesQuotationId;
    data['customerAddressId'] = customerAddressId;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['updatedBy'] = updatedBy;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
