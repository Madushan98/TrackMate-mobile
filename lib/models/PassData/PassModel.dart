/// id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// generatedDateTime : "2022-08-20T15:18:45.111Z"
/// isValid : true
/// passCategory : "string"
/// from : "string"
/// to : "string"
/// isApproved : true
/// isReoccurring : true
/// startDateTime : "2022-08-20T15:18:45.111Z"
/// endDateTime : "2022-08-20T15:18:45.111Z"
/// userId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// nationalId : "string"
/// fullName : "string"
/// primaryContactNumber : "string"
/// isVerifiedUser : true

class PassModel {
  PassModel({
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

  PassModel.fromJson(dynamic json) {
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
  String? primaryContactNumber;
  bool? isVerifiedUser;
PassModel copyWith({  String? id,
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
  String? primaryContactNumber,
  bool? isVerifiedUser,
}) => PassModel(  id: id ?? this.id,
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