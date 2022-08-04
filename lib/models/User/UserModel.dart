/// userId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// nationalId : "string"
/// firstName : "string"
/// lastName : "string"
/// birthDate : "2022-08-04T08:02:44.816Z"
/// primaryContactNumber : "string"
/// town : "string"
/// district : "string"
/// isVertified : true
/// permissions : [0]
/// roles : ["string"]

class User {
  User({
    this.userId,
    this.nationalId,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.primaryContactNumber,
    this.town,
    this.district,
    this.isVertified,
    this.permissions,
    this.roles,
  });

  User.fromJson(dynamic json) {
    userId = json['userId'];
    nationalId = json['nationalId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    birthDate = json['birthDate'];
    primaryContactNumber = json['primaryContactNumber'];
    town = json['town'];
    district = json['district'];
    isVertified = json['isVertified'];
    permissions =
        json['permissions'] != null ? json['permissions'].cast<int>() : [];
    roles = json['roles'] != null ? json['roles'].cast<String>() : [];
  }
  String? userId;
  String? nationalId;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? primaryContactNumber;
  String? town;
  String? district;
  bool? isVertified;
  List<int>? permissions;
  List<String>? roles;
  User copyWith({
    String? userId,
    String? nationalId,
    String? firstName,
    String? lastName,
    String? birthDate,
    String? primaryContactNumber,
    String? town,
    String? district,
    bool? isVertified,
    List<int>? permissions,
    List<String>? roles,
  }) =>
      User(
        userId: userId ?? this.userId,
        nationalId: nationalId ?? this.nationalId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        birthDate: birthDate ?? this.birthDate,
        primaryContactNumber: primaryContactNumber ?? this.primaryContactNumber,
        town: town ?? this.town,
        district: district ?? this.district,
        isVertified: isVertified ?? this.isVertified,
        permissions: permissions ?? this.permissions,
        roles: roles ?? this.roles,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['nationalId'] = nationalId;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['birthDate'] = birthDate;
    map['primaryContactNumber'] = primaryContactNumber;
    map['town'] = town;
    map['district'] = district;
    map['isVertified'] = isVertified;
    map['permissions'] = permissions;
    map['roles'] = roles;
    return map;
  }
}
