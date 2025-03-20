class MainReportModel {
  num? statusCode;
  Data? data;

  MainReportModel({this.statusCode, this.data});

  MainReportModel.fromJson(Map<String, dynamic> json) {
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
  num? customerCrditLimit;
  num? customerBalance;
  num? customerOpenDeliveryNotesBalanace;
  num? totalOrders;
  num? totalOrdersAmount;
  num? totalDeliveries;
  num? totalDeliveriesAmount;
  List<OrdersInfo>? ordersInfo;
  List<MostOrderedItemsByQuantity>? mostOrderedItemsByQuantity;
  List<MostOrderedItemsByAmount>? mostOrderedItemsByAmount;
  List<DeliveriesInfo>? deliveriesInfo;

  Data(
      {this.customerCrditLimit,
      this.customerBalance,
      this.customerOpenDeliveryNotesBalanace,
      this.totalOrders,
      this.totalOrdersAmount,
      this.totalDeliveries,
      this.totalDeliveriesAmount,
      this.ordersInfo,
      this.mostOrderedItemsByQuantity,
      this.mostOrderedItemsByAmount,
      this.deliveriesInfo});

  Data.fromJson(Map<String, dynamic> json) {
    customerCrditLimit = json['customerCrditLimit'];
    customerBalance = json['customerBalance'];
    customerOpenDeliveryNotesBalanace =
        json['customerOpenDeliveryNotesBalanace'];
    totalOrders = json['totalOrders'];
    totalOrdersAmount = json['totalOrdersAmount'];
    totalDeliveries = json['totalDeliveries'];
    totalDeliveriesAmount = json['totalDeliveriesAmount'];
    if (json['ordersInfo'] != null) {
      ordersInfo = <OrdersInfo>[];
      json['ordersInfo'].forEach((v) {
        ordersInfo!.add(OrdersInfo.fromJson(v));
      });
    }
    if (json['mostOrderedItemsByQuantity'] != null) {
      mostOrderedItemsByQuantity = <MostOrderedItemsByQuantity>[];
      json['mostOrderedItemsByQuantity'].forEach((v) {
        mostOrderedItemsByQuantity!.add(MostOrderedItemsByQuantity.fromJson(v));
      });
    }
    if (json['mostOrderedItemsByAmount'] != null) {
      mostOrderedItemsByAmount = <MostOrderedItemsByAmount>[];
      json['mostOrderedItemsByAmount'].forEach((v) {
        mostOrderedItemsByAmount!.add(MostOrderedItemsByAmount.fromJson(v));
      });
    }
    if (json['deliveriesInfo'] != null) {
      deliveriesInfo = <DeliveriesInfo>[];
      json['deliveriesInfo'].forEach((v) {
        deliveriesInfo!.add(DeliveriesInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerCrditLimit'] = customerCrditLimit;
    data['customerBalance'] = customerBalance;
    data['totalOrders'] = totalOrders;
    data['customerOpenDeliveryNotesBalanace'] =
        customerOpenDeliveryNotesBalanace;
    data['totalOrdersAmount'] = totalOrdersAmount;
    data['totalDeliveries'] = totalDeliveries;
    data['totalDeliveriesAmount'] = totalDeliveriesAmount;
    if (ordersInfo != null) {
      data['ordersInfo'] = ordersInfo!.map((v) => v.toJson()).toList();
    }
    if (mostOrderedItemsByQuantity != null) {
      data['mostOrderedItemsByQuantity'] =
          mostOrderedItemsByQuantity!.map((v) => v.toJson()).toList();
    }
    if (mostOrderedItemsByAmount != null) {
      data['mostOrderedItemsByAmount'] =
          mostOrderedItemsByAmount!.map((v) => v.toJson()).toList();
    }
    if (deliveriesInfo != null) {
      data['deliveriesInfo'] = deliveriesInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrdersInfo {
  String? date;
  String? dateFormatted;
  num? count;
  num? amount;

  OrdersInfo({this.date, this.dateFormatted, this.count, this.amount});

  OrdersInfo.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateFormatted = json['dateFormatted'];
    count = json['count'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['dateFormatted'] = dateFormatted;
    data['count'] = count;
    data['amount'] = amount;
    return data;
  }
}

class MostOrderedItemsByQuantity {
  num? count;
  num? amount;
  num? itemId;
  String? itemCode;
  String? itemName;

  MostOrderedItemsByQuantity(
      {this.count, this.amount, this.itemId, this.itemCode, this.itemName});

  MostOrderedItemsByQuantity.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    amount = json['amount'];
    itemId = json['itemId'];
    itemCode = json['itemCode'];
    itemName = json['itemName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['amount'] = amount;
    data['itemId'] = itemId;
    data['itemCode'] = itemCode;
    data['itemName'] = itemName;
    return data;
  }
}

class MostOrderedItemsByAmount {
  num? count;
  num? amount;
  num? itemId;
  String? itemName;
  String? itemCode;

  MostOrderedItemsByAmount(
      {this.count, this.amount, this.itemId, this.itemCode, this.itemName});

  MostOrderedItemsByAmount.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    amount = json['amount'];
    itemId = json['itemId'];
    itemName = json['itemName'];
    itemCode = json['itemCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['amount'] = amount;
    data['itemId'] = itemId;
    data['itemName'] = itemName;
    data['itemCode'] = itemCode;
    return data;
  }
}

class DeliveriesInfo {
  String? date;
  String? dateFormatted;
  num? count;
  num? amount;

  DeliveriesInfo({this.date, this.dateFormatted, this.amount, this.count});

  DeliveriesInfo.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateFormatted = json['dateFormatted'];
    count = json['count'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['dateFormatted'] = dateFormatted;
    data['count'] = count;
    data['amount'] = amount;
    return data;
  }
}
