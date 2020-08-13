class AuthLogin {
  final String login;
  final String password;

  int statusRequest = 0;

  /*construtor*/
  AuthLogin({this.login, this.password});

  factory AuthLogin.fromJson(Map<String, dynamic> json) {
    return AuthLogin(login: json['username'], password: json['password']);
  }

  Map toJson() {
    return {
      'username': login,
      'password': password,
      'grant_type': "password",
    };
  }

/*funções [...]*/
}
