/// latitude : 0.0
/// longitude : 0.0
/// logTime : "string"
/// scannerId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// userId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// userNatId : "string"
/// passId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"

class PassLogModel {
  PassLogModel({
    this.latitude,
    this.longitude,
    this.scannerId,
    this.userId,
    this.passId,
  });

  PassLogModel.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    scannerId = json['scannerId'];
    userId = json['userId'];
    passId = json['passId'];
  }
  double? latitude;
  double? longitude;
  String? logTime;
  String? scannerId;
  String? userId;
  String? userNatId;
  String? passId;
  PassLogModel copyWith({
    double? latitude,
    double? longitude,
    String? logTime,
    String? scannerId,
    String? userId,
    String? userNatId,
    String? passId,
  }) =>
      PassLogModel(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        scannerId: scannerId ?? this.scannerId,
        userId: userId ?? this.userId,
        passId: passId ?? this.passId,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['scannerId'] = scannerId;
    map['userId'] = userId;
    map['passId'] = passId;
    return map;
  }
}
