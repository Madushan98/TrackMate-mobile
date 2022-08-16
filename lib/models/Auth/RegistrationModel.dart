/// nationalId : "string"
/// fullName : "string"
/// password : "string"
/// gender : "string"
/// location : "string"
/// age : "string"
/// primaryContactNumber : "string"
/// emergencyContactNumber : "string"
/// town : "string"
/// district : "string"
/// address : "string"
/// deviceId : "string"

class RegistrationModel {
  RegistrationModel({
      this.nationalId, 
      this.fullName, 
      this.password, 
      this.gender, 
      this.location, 
      this.age, 
      this.primaryContactNumber, 
      this.emergencyContactNumber, 
      this.town, 
      this.district, 
      this.address, 
      this.deviceId,});

  RegistrationModel.fromJson(dynamic json) {
    nationalId = json['nationalId'];
    fullName = json['fullName'];
    password = json['password'];
    gender = json['gender'];
    location = json['location'];
    age = json['age'];
    primaryContactNumber = json['primaryContactNumber'];
    emergencyContactNumber = json['emergencyContactNumber'];
    town = json['town'];
    district = json['district'];
    address = json['address'];
    deviceId = json['deviceId'];
  }
  String? nationalId;
  String? fullName;
  String? password;
  String? gender;
  String? location;
  String? age;
  String? primaryContactNumber;
  String? emergencyContactNumber;
  String? town;
  String? district;
  String? address;
  String? deviceId;
RegistrationModel copyWith({  String? nationalId,
  String? fullName,
  String? password,
  String? gender,
  String? location,
  String? age,
  String? primaryContactNumber,
  String? emergencyContactNumber,
  String? town,
  String? district,
  String? address,
  String? deviceId,
}) => RegistrationModel(  nationalId: nationalId ?? this.nationalId,
  fullName: fullName ?? this.fullName,
  password: password ?? this.password,
  gender: gender ?? this.gender,
  location: location ?? this.location,
  age: age ?? this.age,
  primaryContactNumber: primaryContactNumber ?? this.primaryContactNumber,
  emergencyContactNumber: emergencyContactNumber ?? this.emergencyContactNumber,
  town: town ?? this.town,
  district: district ?? this.district,
  address: address ?? this.address,
  deviceId: deviceId ?? this.deviceId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nationalId'] = nationalId;
    map['fullName'] = fullName;
    map['password'] = password;
    map['gender'] = gender;
    map['location'] = location;
    map['age'] = age;
    map['primaryContactNumber'] = primaryContactNumber;
    map['emergencyContactNumber'] = emergencyContactNumber;
    map['town'] = town;
    map['district'] = district;
    map['address'] = address;
    map['deviceId'] = deviceId;
    return map;
  }

}
