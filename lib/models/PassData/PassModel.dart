/// id : "22222221-1111-1111-1111-111111111111"
/// generatedDateTime : "2022-08-17T20:27:24.286603Z"
/// isValid : true
/// isApproved : true
/// isReoccurring : false
/// startDateTime : "0001-01-01T00:00:00"
/// endDateTime : "0001-01-01T00:00:00"
/// userId : "11111111-1111-1111-1111-111111111111"
/// nationalId : "982351123V"

class PassLog {
  PassLog({
    this.id,
    this.generatedDateTime,
    this.isValid,
    this.isApproved,
    this.isReoccurring,
    this.startDateTime,
    this.endDateTime,
    this.userId,
    this.nationalId,});

  PassLog.fromJson(dynamic json) {
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
  PassLog copyWith({  String? id,
    String? generatedDateTime,
    bool? isValid,
    bool? isApproved,
    bool? isReoccurring,
    String? startDateTime,
    String? endDateTime,
    String? userId,
    String? nationalId,
  }) => PassLog(  id: id ?? this.id,
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