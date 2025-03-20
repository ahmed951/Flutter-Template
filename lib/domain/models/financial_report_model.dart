class FinancialReportModel {
  int? statusCode;
  Data? data;

  FinancialReportModel({this.statusCode, this.data});

  FinancialReportModel.fromJson(Map<String, dynamic> json) {
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
  String? customerCode;
  String? customerName;
  String? dateFrom;
  String? dateTo;
  int? openingBalance;
  List<Transactions>? transactions;

  Data(
      {this.customerCode,
      this.customerName,
      this.dateFrom,
      this.dateTo,
      this.openingBalance,
      this.transactions});

  Data.fromJson(Map<String, dynamic> json) {
    customerCode = json['customerCode'];
    customerName = json['customerName'];
    dateFrom = json['dateFrom'];
    dateTo = json['dateTo'];
    openingBalance = json['openingBalance'];
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerCode'] = customerCode;
    data['customerName'] = customerName;
    data['dateFrom'] = dateFrom;
    data['dateTo'] = dateTo;
    data['openingBalance'] = openingBalance;
    if (transactions != null) {
      data['transactions'] = transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transactions {
  String? transactionDate;
  String? transactionDetails;
  String? currency;
  double? debit;
  int? credit;
  double? balance;

  Transactions(
      {this.transactionDate,
      this.transactionDetails,
      this.currency,
      this.debit,
      this.credit,
      this.balance});

  Transactions.fromJson(Map<String, dynamic> json) {
    transactionDate = json['transactionDate'];
    transactionDetails = json['transactionDetails'];
    currency = json['currency'];
    debit = json['debit'];
    credit = json['credit'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transactionDate'] = transactionDate;
    data['transactionDetails'] = transactionDetails;
    data['currency'] = currency;
    data['debit'] = debit;
    data['credit'] = credit;
    data['balance'] = balance;
    return data;
  }
}
