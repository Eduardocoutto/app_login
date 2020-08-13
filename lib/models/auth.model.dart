/*https://stackoverflow.com/questions/17488611/how-to-create-private-variables-in-dart*/
class Auth {
  final String accessToken;
  int statusResponse;

  /*construtor*/
  Auth({this.accessToken, this.statusResponse});

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(accessToken: json['access_token'], statusResponse: 0);
  }

  static Auth fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Auth(accessToken: map['access_token']);
  }

  /* Map toJson() {
    return {'id': id, 'name': name, 'email': email};
  } */

/*funções [...]*/

}
