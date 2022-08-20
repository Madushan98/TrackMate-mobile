/// latitude : 0.0
/// longitude : 0.0
/// scannerId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// passId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// userId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"

class PassLogModel {
  PassLogModel({
      this.latitude, 
      this.longitude, 
      this.scannerId, 
      this.passId, 
      this.userId,});

  PassLogModel.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    scannerId = json['scannerId'];
    passId = json['passId'];
    userId = json['userId'];
  }
  double? latitude;
  double? longitude;
  String? scannerId;
  String? passId;
  String? userId;
PassLogModel copyWith({  double? latitude,
  double? longitude,
  String? scannerId,
  String? passId,
  String? userId,
}) => PassLogModel(  latitude: latitude ?? this.latitude,
  longitude: longitude ?? this.longitude,
  scannerId: scannerId ?? this.scannerId,
  passId: passId ?? this.passId,
  userId: userId ?? this.userId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['scannerId'] = scannerId;
    map['passId'] = passId;
    map['userId'] = userId;
    return map;
  }

}