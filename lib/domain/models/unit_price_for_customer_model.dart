class UnitPriceForCustomerModel {
  int? statusCode;
  Data? data;

  UnitPriceForCustomerModel({this.statusCode, this.data});

  UnitPriceForCustomerModel.fromJson(Map<String, dynamic> json) {
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
  num? unitPrice;
  String? salesQuotationNumber;
  int? salesQuotationId;
  int? salesQuotationLineId;

  Data(
      {this.unitPrice,
      this.salesQuotationNumber,
      this.salesQuotationId,
      this.salesQuotationLineId});

  Data.fromJson(Map<String, dynamic> json) {
    unitPrice = json['unitPrice'];
    salesQuotationNumber = json['salesQuotationNumber'];
    salesQuotationId = json['salesQuotationId'];
    salesQuotationLineId = json['salesQuotationLineId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unitPrice'] = unitPrice;
    data['salesQuotationNumber'] = salesQuotationNumber;
    data['salesQuotationId'] = salesQuotationId;
    data['salesQuotationLineId'] = salesQuotationLineId;
    return data;
  }
}
