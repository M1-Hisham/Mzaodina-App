class LoginResponseModel {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? error;
  LoginResponseModel({this.accessToken, this.tokenType, this.expiresIn});
  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    error = json['error'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    data['error'] = error;
    return data;
  }
}
