class UsuarioModel {
  int idUsuario;
  String email;
  String login;
  String senha;
  bool status;
  bool admin;

  UsuarioModel(
      {this.idUsuario,
      this.email,
      this.login,
      this.senha,
      this.status,
      this.admin});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    idUsuario = json['IdUsuario'];
    email = json['Email'];
    login = json['Login'];
    senha = json['Senha'];
    status = json['Status'];
    admin = json['Admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdUsuario'] = this.idUsuario;
    data['Email'] = this.email;
    data['Login'] = this.login;
    data['Senha'] = this.senha;
    data['Status'] = this.status;
    data['Admin'] = this.admin;
    return data;
  }

  Map<String, String> toMap() {
    final Map<String, String> data = new Map<String, String>();
    data['IdUsuario'] = this.idUsuario.toString();
    data['Email'] = this.email;
    data['Login'] = this.login;
    data['Senha'] = this.senha;
    data['Status'] = this.status.toString();
    data['Admin'] = this.admin.toString();
    return data;
  }

  static UsuarioModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UsuarioModel(
        idUsuario: map['IdUsuario'],
        email: map['Email'],
        login: map['Login'],
        senha: map['Senha'],
        status: map['Status'],
        admin: map['Admin']);
  }
}
