/// id : "11111111-1111-1111-1111-111111112213"
/// nationalId : "9843211234"
/// fullName : "Achila Sandeep"
/// town : null
/// district : null
/// isVertified : "Pending"
/// gender : null
/// location : null
/// birthDate : "0001-01-01T00:00:00"
/// primaryContactNumber : null
/// emergencyContactNumber : null
/// userType : "User"
/// permissions : null
/// roles : null
/// vaccinationData : []

class User {
  User({
      this.id, 
      this.nationalId, 
      this.fullName, 
      this.town, 
      this.district, 
      this.isVertified, 
      this.gender, 
      this.location, 
      this.birthDate, 
      this.primaryContactNumber, 
      this.emergencyContactNumber, 
      this.userType, 
      this.permissions, 
      this.roles, 
      });

  User.fromJson(dynamic json) {
    id = json['id'];
    nationalId = json['nationalId'];
    fullName = json['fullName'];
    town = json['town'];
    district = json['district'];
    isVertified = json['isVertified'];
    gender = json['gender'];
    location = json['location'];
    birthDate = json['birthDate'];
    primaryContactNumber = json['primaryContactNumber'];
    emergencyContactNumber = json['emergencyContactNumber'];
    userType = json['userType'];
    permissions = json['permissions'];
    roles = json['roles'];

  }
  String? id;
  String? nationalId;
  String? fullName;
  dynamic town;
  dynamic district;
  String? isVertified;
  dynamic gender;
  dynamic location;
  String? birthDate;
  dynamic primaryContactNumber;
  dynamic emergencyContactNumber;
  String? userType;
  dynamic permissions;
  dynamic roles;

User copyWith({  String? id,
  String? nationalId,
  String? fullName,
  dynamic town,
  dynamic district,
  String? isVertified,
  dynamic gender,
  dynamic location,
  String? birthDate,
  dynamic primaryContactNumber,
  dynamic emergencyContactNumber,
  String? userType,
  dynamic permissions,
  dynamic roles,
  List<dynamic>? vaccinationData,
}) => User(  id: id ?? this.id,
  nationalId: nationalId ?? this.nationalId,
  fullName: fullName ?? this.fullName,
  town: town ?? this.town,
  district: district ?? this.district,
  isVertified: isVertified ?? this.isVertified,
  gender: gender ?? this.gender,
  location: location ?? this.location,
  birthDate: birthDate ?? this.birthDate,
  primaryContactNumber: primaryContactNumber ?? this.primaryContactNumber,
  emergencyContactNumber: emergencyContactNumber ?? this.emergencyContactNumber,
  userType: userType ?? this.userType,
  permissions: permissions ?? this.permissions,
  roles: roles ?? this.roles,

);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nationalId'] = nationalId;
    map['fullName'] = fullName;
    map['town'] = town;
    map['district'] = district;
    map['isVertified'] = isVertified;
    map['gender'] = gender;
    map['location'] = location;
    map['birthDate'] = birthDate;
    map['primaryContactNumber'] = primaryContactNumber;
    map['emergencyContactNumber'] = emergencyContactNumber;
    map['userType'] = userType;
    map['permissions'] = permissions;
    map['roles'] = roles;
    return map;
  }

}