/// nationalId : "988888888"
/// isReoccurring : true
/// passCategory : "string"
/// from : "string"
/// to : "string"
/// data : [{"key":"string","value":"string"}]
/// startDateTime : "2022-12-17T07:37:31.865Z"
/// endDateTime : "2022-12-17T07:37:31.865Z"
/// userId : "11111111-1111-1111-1111-111111111112"

class NewPassModel {
  NewPassModel({
    this.nationalId,
    this.isReoccurring,
    this.passCategory,
    this.from,
    this.to,
    this.data,
    this.startDateTime,
    this.endDateTime,
    this.userId,
  });

  NewPassModel.fromJson(dynamic json) {
    nationalId = json['nationalId'];
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
  bool? isReoccurring;
  String? passCategory;
  String? from;
  String? to;
  List<Data>? data;
  String? startDateTime;
  String? endDateTime;
  String? userId;
  NewPassModel copyWith({
    String? nationalId,
    bool? isReoccurring,
    String? passCategory,
    String? from,
    String? to,
    List<Data>? data,
    String? startDateTime,
    String? endDateTime,
    String? userId,
  }) =>
      NewPassModel(
        nationalId: nationalId ?? this.nationalId,
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

  @override
  String toString() {
    return 'NewPassModel{nationalId: $nationalId, isReoccurring: $isReoccurring, passCategory: $passCategory, from: $from, to: $to, data: $data, startDateTime: $startDateTime, endDateTime: $endDateTime, userId: $userId}';
  }
}

/// key : "string"
/// value : "string"

class Data {
  Data({
    this.key,
    this.value,
  });

  Data.fromJson(dynamic json) {
    key = json['key'];
    value = json['value'];
  }
  String? key;
  String? value;
  Data copyWith({
    String? key,
    String? value,
  }) =>
      Data(
        key: key ?? this.key,
        value: value ?? this.value,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    map['value'] = value;
    return map;
  }
}
