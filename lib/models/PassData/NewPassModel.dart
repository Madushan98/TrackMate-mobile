/// nationalId : "string"
/// passTitle : "string"
/// isReoccurring : true
/// passCategory : "string"
/// from : "string"
/// to : "string"
/// data : [{"key":"string","value":"string"}]
/// startDateTime : "2022-12-23T14:43:23.144Z"
/// endDateTime : "2022-12-23T14:43:23.144Z"
/// userId : "3fa85f64-5717-4562-b3fc-2c963f66afa6"

class NewPassModel {
  NewPassModel({
      this.nationalId, 
      this.passTitle, 
      this.isReoccurring, 
      this.passCategory, 
      this.from, 
      this.to, 
      this.data, 
      this.startDateTime, 
      this.endDateTime, 
      this.userId,});

  NewPassModel.fromJson(dynamic json) {
    nationalId = json['nationalId'];
    passTitle = json['passTitle'];
    isReoccurring = json['isReoccurring'];
    passCategory = json['passCategory'];
    from = json['from'];
    to = json['to'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    startDateTime = json['startDateTime'];
    endDateTime = json['endDateTime'];
    userId = json['userId'];
  }
  String? nationalId;
  String? passTitle;
  bool? isReoccurring;
  String? passCategory;
  String? from;
  String? to;
  List<Data>? data;
  String? startDateTime;
  String? endDateTime;
  String? userId;
NewPassModel copyWith({  String? nationalId,
  String? passTitle,
  bool? isReoccurring,
  String? passCategory,
  String? from,
  String? to,
  List<Data>? data,
  String? startDateTime,
  String? endDateTime,
  String? userId,
}) => NewPassModel(  nationalId: nationalId ?? this.nationalId,
  passTitle: passTitle ?? this.passTitle,
  isReoccurring: isReoccurring ?? this.isReoccurring,
  passCategory: passCategory ?? this.passCategory,
  from: from ?? this.from,
  to: to ?? this.to,
  data: data ?? this.data,
  startDateTime: startDateTime ?? this.startDateTime,
  endDateTime: endDateTime ?? this.endDateTime,
  userId: userId ?? this.userId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nationalId'] = nationalId;
    map['passTitle'] = passTitle;
    map['isReoccurring'] = isReoccurring;
    map['passCategory'] = passCategory;
    map['from'] = from;
    map['to'] = to;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['startDateTime'] = startDateTime;
    map['endDateTime'] = endDateTime;
    map['userId'] = userId;
    return map;
  }

}

/// key : "string"
/// value : "string"

class Data {
  Data({
      this.key, 
      this.value,});

  Data.fromJson(dynamic json) {
    key = json['key'];
    value = json['value'];
  }
  String? key;
  String? value;
Data copyWith({  String? key,
  String? value,
}) => Data(  key: key ?? this.key,
  value: value ?? this.value,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    map['value'] = value;
    return map;
  }

}