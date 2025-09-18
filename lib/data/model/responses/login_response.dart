class LoginResponse {
  String? token;
  String? userName;
  String? email;

  LoginResponse({
    this.token,
    this.userName,
    this.email,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      userName: json['username'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
    'token': token,
    'userName': userName,
    'email': email,
  };
}
