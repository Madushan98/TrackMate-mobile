/// id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// nationalId : "string"
/// fullName : "string"
/// town : "string"
/// district : "string"
/// isVertified : true
/// gender : "string"
/// location : "string"
/// birthDate : "2022-08-17T18:17:40.969Z"
/// primaryContactNumber : "string"
/// emergencyContactNumber : "string"
/// userType : "string"
/// permissions : [0]
/// roles : ["string"]

class User {
  User({

      this.nationalId, 
      this.fullName, 
      this.town, 
      this.district, 
      this.isVertified, 
      this.gender, 
      this.location,
      this.primaryContactNumber, 
      this.emergencyContactNumber, 
      this.userType,});

  User.fromJson(dynamic json) {

    nationalId = json['nationalId'];
    fullName = json['fullName'];
    town = json['town'];
    district = json['district'];
    isVertified = json['isVertified'];
    gender = json['gender'];
    location = json['location'];
    primaryContactNumber = json['primaryContactNumber'];
    emergencyContactNumber = json['emergencyContactNumber'];
    userType = json['userType'];
  }

  String? nationalId;
  String? fullName;
  String? town;
  String? district;
  bool? isVertified;
  String? gender;
  String? location;
  String? birthDate;
  String? primaryContactNumber;
  String? emergencyContactNumber;
  String? userType;

User copyWith({  String? id,
  String? nationalId,
  String? fullName,
  String? town,
  String? district,
  bool? isVertified,
  String? gender,
  String? location,
  String? primaryContactNumber,
  String? emergencyContactNumber,
  String? userType,

}) => User(
  nationalId: nationalId ?? this.nationalId,
  fullName: fullName ?? this.fullName,
  town: town ?? this.town,
  district: district ?? this.district,
  isVertified: isVertified ?? this.isVertified,
  gender: gender ?? this.gender,
  location: location ?? this.location,
  primaryContactNumber: primaryContactNumber ?? this.primaryContactNumber,
  emergencyContactNumber: emergencyContactNumber ?? this.emergencyContactNumber,
  userType: userType ?? this.userType,

);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nationalId'] = nationalId;
    map['fullName'] = fullName;
    map['town'] = town;
    map['district'] = district;
    map['isVertified'] = isVertified;
    map['gender'] = gender;
    map['location'] = location;
    map['primaryContactNumber'] = primaryContactNumber;
    map['emergencyContactNumber'] = emergencyContactNumber;
    map['userType'] = userType;
    return map;
  }

}