/// id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// generatedDateTime : "2022-08-19T13:22:29.242Z"
/// isValid : true
/// isApproved : true
/// isReoccurring : true
/// startDateTime : "2022-08-19T13:22:29.242Z"
/// endDateTime : "2022-08-19T13:22:29.242Z"
/// userId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// nationalId : "string"

class PassVerifyModel {
  PassVerifyModel({
      this.id, 
      this.generatedDateTime, 
      this.isValid, 
      this.isApproved, 
      this.isReoccurring, 
      this.startDateTime, 
      this.endDateTime, 
      this.userId, 
      this.nationalId,});

  PassVerifyModel.fromJson(dynamic json) {
    id = json['id'];
    generatedDateTime = json['generatedDateTime'];
    isValid = json['isValid'];
    isApproved = json['isApproved'];
    isReoccurring = json['isReoccurring'];
    startDateTime = json['startDateTime'];
    endDateTime = json['endDateTime'];
    userId = json['userId'];
    nationalId = json['nationalId'];
  }
  String? id;
  String? generatedDateTime;
  bool? isValid;
  bool? isApproved;
  bool? isReoccurring;
  String? startDateTime;
  String? endDateTime;
  String? userId;
  String? nationalId;
PassVerifyModel copyWith({  String? id,
  String? generatedDateTime,
  bool? isValid,
  bool? isApproved,
  bool? isReoccurring,
  String? startDateTime,
  String? endDateTime,
  String? userId,
  String? nationalId,
}) => PassVerifyModel(  id: id ?? this.id,
  generatedDateTime: generatedDateTime ?? this.generatedDateTime,
  isValid: isValid ?? this.isValid,
  isApproved: isApproved ?? this.isApproved,
  isReoccurring: isReoccurring ?? this.isReoccurring,
  startDateTime: startDateTime ?? this.startDateTime,
  endDateTime: endDateTime ?? this.endDateTime,
  userId: userId ?? this.userId,
  nationalId: nationalId ?? this.nationalId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['generatedDateTime'] = generatedDateTime;
    map['isValid'] = isValid;
    map['isApproved'] = isApproved;
    map['isReoccurring'] = isReoccurring;
    map['startDateTime'] = startDateTime;
    map['endDateTime'] = endDateTime;
    map['userId'] = userId;
    map['nationalId'] = nationalId;
    return map;
  }

}