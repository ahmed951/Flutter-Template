class ReportModel {
  int? statusCode;
  Data? data;

  ReportModel({this.statusCode, this.data});

  ReportModel.fromJson(Map<String, dynamic> json) {
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
  String? pdfContent;
  String? htmlContent;

  Data({this.pdfContent, this.htmlContent});

  Data.fromJson(Map<String, dynamic> json) {
    pdfContent = json['pdfContent'];
    htmlContent = json['htmlContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pdfContent'] = pdfContent;
    data['htmlContent'] = htmlContent;
    return data;
  }
}
