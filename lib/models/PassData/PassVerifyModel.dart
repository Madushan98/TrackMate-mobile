/// id : "22222221-1111-1111-1111-111111111111"
/// generatedDateTime : "2022-08-19T21:09:28.565401Z"
/// isValid : true
/// passCategory : "Employee"
/// from : "Rathnapura"
/// to : "Colombo"
/// isApproved : true
/// isReoccurring : false
/// startDateTime : "0001-01-01T00:00:00"
/// endDateTime : "0001-01-01T00:00:00"
/// userId : "11111111-1111-1111-1111-111111111111"
/// nationalId : "982351123V"
/// fullName : "Admin"
/// primaryContactNumber : null
/// isVerifiedUser : true

class PassVerifyModel {
  PassVerifyModel({
      this.id, 
      this.generatedDateTime, 
      this.isValid, 
      this.passCategory, 
      this.from, 
      this.to, 
      this.isApproved, 
      this.isReoccurring, 
      this.startDateTime, 
      this.endDateTime, 
      this.userId, 
      this.nationalId, 
      this.fullName, 
      this.primaryContactNumber, 
      this.isVerifiedUser,});

  PassVerifyModel.fromJson(dynamic json) {
    id = json['id'];
    generatedDateTime = json['generatedDateTime'];
    isValid = json['isValid'];
    passCategory = json['passCategory'];
    from = json['from'];
    to = json['to'];
    isApproved = json['isApproved'];
    isReoccurring = json['isReoccurring'];
    startDateTime = json['startDateTime'];
    endDateTime = json['endDateTime'];
    userId = json['userId'];
    nationalId = json['nationalId'];
    fullName = json['fullName'];
    primaryContactNumber = json['primaryContactNumber'];
    isVerifiedUser = json['isVerifiedUser'];
  }
  String? id;
  String? generatedDateTime;
  bool? isValid;
  String? passCategory;
  String? from;
  String? to;
  bool? isApproved;
  bool? isReoccurring;
  String? startDateTime;
  String? endDateTime;
  String? userId;
  String? nationalId;
  String? fullName;
  dynamic primaryContactNumber;
  bool? isVerifiedUser;
PassVerifyModel copyWith({  String? id,
  String? generatedDateTime,
  bool? isValid,
  String? passCategory,
  String? from,
  String? to,
  bool? isApproved,
  bool? isReoccurring,
  String? startDateTime,
  String? endDateTime,
  String? userId,
  String? nationalId,
  String? fullName,
  dynamic primaryContactNumber,
  bool? isVerifiedUser,
}) => PassVerifyModel(  id: id ?? this.id,
  generatedDateTime: generatedDateTime ?? this.generatedDateTime,
  isValid: isValid ?? this.isValid,
  passCategory: passCategory ?? this.passCategory,
  from: from ?? this.from,
  to: to ?? this.to,
  isApproved: isApproved ?? this.isApproved,
  isReoccurring: isReoccurring ?? this.isReoccurring,
  startDateTime: startDateTime ?? this.startDateTime,
  endDateTime: endDateTime ?? this.endDateTime,
  userId: userId ?? this.userId,
  nationalId: nationalId ?? this.nationalId,
  fullName: fullName ?? this.fullName,
  primaryContactNumber: primaryContactNumber ?? this.primaryContactNumber,
  isVerifiedUser: isVerifiedUser ?? this.isVerifiedUser,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['generatedDateTime'] = generatedDateTime;
    map['isValid'] = isValid;
    map['passCategory'] = passCategory;
    map['from'] = from;
    map['to'] = to;
    map['isApproved'] = isApproved;
    map['isReoccurring'] = isReoccurring;
    map['startDateTime'] = startDateTime;
    map['endDateTime'] = endDateTime;
    map['userId'] = userId;
    map['nationalId'] = nationalId;
    map['fullName'] = fullName;
    map['primaryContactNumber'] = primaryContactNumber;
    map['isVerifiedUser'] = isVerifiedUser;
    return map;
  }

}