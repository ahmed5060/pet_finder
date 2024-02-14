class AuthModel {
  AuthModel({
      this.tokenType, 
      this.expiresIn, 
      this.accessToken,});

  AuthModel.fromJson(dynamic json) {
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    accessToken = json['access_token'];
  }
  String? tokenType;
  int? expiresIn;
  String? accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token_type'] = tokenType;
    map['expires_in'] = expiresIn;
    map['access_token'] = accessToken;
    return map;
  }

}