class ResetResponseModel {
  final String token;
  final String error;

  ResetResponseModel({this.token, this.error});

  factory ResetResponseModel.fromJson(Map<String, dynamic> json) {
    return ResetResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class ResetRequestModel {
  String name;
  String password;
  String newpassword;
  String confirmpassword;

  ResetRequestModel({
    this.name,
    this.password,
    this.newpassword,
    this.confirmpassword,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': name.trim(),
      'password': password.trim(),
      'newpassword': newpassword.trim(),
      'confirmpassword': confirmpassword.trim(),
    };

    return map;
  }
}
