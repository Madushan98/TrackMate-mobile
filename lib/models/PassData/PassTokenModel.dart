/// passToken : "string"

class PassTokenModel {
  PassTokenModel({
      this.passToken,});

  PassTokenModel.fromJson(dynamic json) {
    passToken = json['passToken'];
  }
  String? passToken;
PassTokenModel copyWith({  String? passToken,
}) => PassTokenModel(  passToken: passToken ?? this.passToken,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['passToken'] = passToken;
    return map;
  }

}