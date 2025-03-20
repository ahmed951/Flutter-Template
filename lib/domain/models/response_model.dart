class Response {
  int? statusCode;
  String? data;

  Response({this.statusCode, this.data});

  Response.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;

    data['data'] = data;

    return data;
  }
}

/* class Data {
  int? statusCode;
  String? message; // Renamed for clarity

  Data({this.statusCode, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    // Safely parse `data` as a String
    message = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['data'] = message; // Ensure it's serialized correctly
    return data;
  }
}
 */