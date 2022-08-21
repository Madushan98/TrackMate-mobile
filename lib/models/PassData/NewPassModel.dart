/// nationalId : "string"
/// isReoccurring : true
/// passCategory : "string"
/// from : "string"
/// to : "string"
/// startDateTime : "2022-08-20T19:57:26.034Z"
/// endDateTime : "2022-08-20T19:57:26.034Z"
/// userId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"

class NewPassModel {
  NewPassModel({
      this.nationalId, 
      this.isReoccurring, 
      this.passCategory, 
      this.from, 
      this.to, 
      this.startDateTime, 
      this.endDateTime, 
      this.userId,});

  NewPassModel.fromJson(dynamic json) {
    nationalId = json['nationalId'];
    isReoccurring = json['isReoccurring'];
    passCategory = json['passCategory'];
    from = json['from'];
    to = json['to'];
    startDateTime = json['startDateTime'];
    endDateTime = json['endDateTime'];
    userId = json['userId'];
  }
  String? nationalId;
  bool? isReoccurring;
  String? passCategory;
  String? from;
  String? to;
  String? startDateTime;
  String? endDateTime;
  String? userId;
NewPassModel copyWith({  String? nationalId,
  bool? isReoccurring,
  String? passCategory,
  String? from,
  String? to,
  String? startDateTime,
  String? endDateTime,
  String? userId,
}) => NewPassModel(  nationalId: nationalId ?? this.nationalId,
  isReoccurring: isReoccurring ?? this.isReoccurring,
  passCategory: passCategory ?? this.passCategory,
  from: from ?? this.from,
  to: to ?? this.to,
  startDateTime: startDateTime ?? this.startDateTime,
  endDateTime: endDateTime ?? this.endDateTime,
  userId: userId ?? this.userId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nationalId'] = nationalId;
    map['isReoccurring'] = isReoccurring;
    map['passCategory'] = passCategory;
    map['from'] = from;
    map['to'] = to;
    map['startDateTime'] = startDateTime;
    map['endDateTime'] = endDateTime;
    map['userId'] = userId;
    return map;
  }

}