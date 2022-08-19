/// statusCode : 401
/// message : "Credentials are Wrong"

class ErrorModel {
  ErrorModel({
      this.statusCode, 
      this.message,});

  ErrorModel.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
  }
  int? statusCode;
  String? message;
ErrorModel copyWith({  int? statusCode,
  String? message,
}) => ErrorModel(  statusCode: statusCode ?? this.statusCode,
  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    return map;
  }

}