/// id : "11111111-1111-1111-1111-111111111111"
/// organizationName : "Test Organization"
/// address : null
/// city : null
/// state : null
/// postalCode : null
/// userType : "Organization"
/// emailAddress : "Test@gmail.com"
/// mobileNumber : "07555555555"
/// organizationType : "Health"
/// employeesWithPasses : 0
/// isApproved : true

class OrganizationModel {
  OrganizationModel({
      this.id, 
      this.organizationName, 
      this.address, 
      this.city, 
      this.state, 
      this.postalCode, 
      this.userType, 
      this.emailAddress, 
      this.mobileNumber, 
      this.organizationType, 
      this.employeesWithPasses, 
      this.isApproved,});

  OrganizationModel.fromJson(dynamic json) {
    id = json['id'];
    organizationName = json['organizationName'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postalCode'];
    userType = json['userType'];
    emailAddress = json['emailAddress'];
    mobileNumber = json['mobileNumber'];
    organizationType = json['organizationType'];
    employeesWithPasses = json['employeesWithPasses'];
    isApproved = json['isApproved'];
  }
  String? id;
  String? organizationName;
  dynamic address;
  dynamic city;
  dynamic state;
  dynamic postalCode;
  String? userType;
  String? emailAddress;
  String? mobileNumber;
  String? organizationType;
  int? employeesWithPasses;
  bool? isApproved;
OrganizationModel copyWith({  String? id,
  String? organizationName,
  dynamic address,
  dynamic city,
  dynamic state,
  dynamic postalCode,
  String? userType,
  String? emailAddress,
  String? mobileNumber,
  String? organizationType,
  int? employeesWithPasses,
  bool? isApproved,
}) => OrganizationModel(  id: id ?? this.id,
  organizationName: organizationName ?? this.organizationName,
  address: address ?? this.address,
  city: city ?? this.city,
  state: state ?? this.state,
  postalCode: postalCode ?? this.postalCode,
  userType: userType ?? this.userType,
  emailAddress: emailAddress ?? this.emailAddress,
  mobileNumber: mobileNumber ?? this.mobileNumber,
  organizationType: organizationType ?? this.organizationType,
  employeesWithPasses: employeesWithPasses ?? this.employeesWithPasses,
  isApproved: isApproved ?? this.isApproved,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['organizationName'] = organizationName;
    map['address'] = address;
    map['city'] = city;
    map['state'] = state;
    map['postalCode'] = postalCode;
    map['userType'] = userType;
    map['emailAddress'] = emailAddress;
    map['mobileNumber'] = mobileNumber;
    map['organizationType'] = organizationType;
    map['employeesWithPasses'] = employeesWithPasses;
    map['isApproved'] = isApproved;
    return map;
  }

}