/// passToken : "LSG5XcuQIlvXx2yyfsnGfryDKiw4TIQ+gJVjAXBNbmVpdj9tYNTy4MEoTD2shi68"

class PassVerifcationRequestModel {
  PassVerifcationRequestModel({
      this.passToken,});

  PassVerifcationRequestModel.fromJson(dynamic json) {
    passToken = json['passToken'];
  }
  String? passToken;
PassVerifcationRequestModel copyWith({  String? passToken,
}) => PassVerifcationRequestModel(  passToken: passToken ?? this.passToken,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['passToken'] = passToken;
    return map;
  }

}