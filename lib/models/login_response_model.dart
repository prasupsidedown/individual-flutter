class LoginResponseModel {
  final String? accessToken; // ← nullable

  LoginResponseModel({this.accessToken});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['accessToken'] ?? json['token'],
    );
  }
}
