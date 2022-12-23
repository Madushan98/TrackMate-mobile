/// latitude : 0.0
/// longitude : 0.0
/// logTime : "string"
/// scannerId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// userId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// userNatId : "string"
/// passId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"

class PassHistoryModel {
  PassHistoryModel({
      this.latitude,
      this.longitude,
      this.logTime, 
      this.scannerId, 
      this.userId, 
      this.userNatId, 
      this.passId,});

  PassHistoryModel.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    logTime = json['logTime'];
    scannerId = json['scannerId'];
    userId = json['userId'];
    userNatId = json['userNatId'];
    passId = json['passId'];
  }
  double? latitude;
  double? longitude;
  String? logTime;
  String? scannerId;
  String? userId;
  String? userNatId;
  String? passId;
PassHistoryModel copyWith({  double? latitude,
  double? longitude,
  String? logTime,
  String? scannerId,
  String? userId,
  String? userNatId,
  String? passId,
}) => PassHistoryModel(  latitude: latitude ?? this.latitude,
  longitude: longitude ?? this.longitude,
  logTime: logTime ?? this.logTime,
  scannerId: scannerId ?? this.scannerId,
  userId: userId ?? this.userId,
  userNatId: userNatId ?? this.userNatId,
  passId: passId ?? this.passId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['logTime'] = logTime;
    map['scannerId'] = scannerId;
    map['userId'] = userId;
    map['userNatId'] = userNatId;
    map['passId'] = passId;
    return map;
  }

  getTimeOnly(){
    String time = this.logTime?.split("T").last ?? "0.00" ;
    return time ;
  }

  getDateOnly(){
    String time = this.logTime?.split("T").first ?? "0.00" ;
    return time ;
  }

}