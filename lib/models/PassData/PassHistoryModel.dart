/// latitude : 6.0779789
/// longitude : 80.1930791
/// scannerId : "11111111-1111-1111-1111-111111111111"
/// userId : "11111111-1111-1111-1111-111111111111"
/// passId : "22222221-1111-1111-1111-111111111111"

class PassHistoryModel {
  PassHistoryModel({
      this.latitude, 
      this.longitude, 
      this.scannerId, 
      this.userId, 
      this.passId,});

  PassHistoryModel.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    scannerId = json['scannerId'];
    userId = json['userId'];
    passId = json['passId'];
  }
  double? latitude;
  double? longitude;
  String? scannerId;
  String? userId;
  String? passId;
PassHistoryModel copyWith({  double? latitude,
  double? longitude,
  String? scannerId,
  String? userId,
  String? passId,
}) => PassHistoryModel(  latitude: latitude ?? this.latitude,
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