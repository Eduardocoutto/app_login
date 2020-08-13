// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.control.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserControl on UserControlBase, Store {
  final _$idUsuarioAtom = Atom(name: 'UserControlBase.idUsuario');

  @override
  int get idUsuario {
    _$idUsuarioAtom.reportRead();
    return super.idUsuario;
  }

  @override
  set idUsuario(int value) {
    _$idUsuarioAtom.reportWrite(value, super.idUsuario, () {
      super.idUsuario = value;
    });
  }

  final _$loginAtom = Atom(name: 'UserControlBase.login');

  @override
  String get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  final _$emailAtom = Atom(name: 'UserControlBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: 'UserControlBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$statusAtom = Atom(name: 'UserControlBase.status');

  @override
  bool get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(bool value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$adminAtom = Atom(name: 'UserControlBase.admin');

  @override
  bool get admin {
    _$adminAtom.reportRead();
    return super.admin;
  }

  @override
  set admin(bool value) {
    _$adminAtom.reportWrite(value, super.admin, () {
      super.admin = value;
    });
  }

  final _$UserControlBaseActionController =
      ActionController(name: 'UserControlBase');

  @override
  dynamic setIdUsuario(int value) {
    final _$actionInfo = _$UserControlBaseActionController.startAction(
        name: 'UserControlBase.setIdUsuario');
    try {
      return super.setIdUsuario(value);
    } finally {
      _$UserControlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLogin(String value) {
    final _$actionInfo = _$UserControlBaseActionController.startAction(
        name: 'UserControlBase.setLogin');
    try {
      return super.setLogin(value);
    } finally {
      _$UserControlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$UserControlBaseActionController.startAction(
        name: 'UserControlBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$UserControlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSenha(String value) {
    final _$actionInfo = _$UserControlBaseActionController.startAction(
        name: 'UserControlBase.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$UserControlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStatus(bool value) {
    final _$actionInfo = _$UserControlBaseActionController.startAction(
        name: 'UserControlBase.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$UserControlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAdmin(bool value) {
    final _$actionInfo = _$UserControlBaseActionController.startAction(
        name: 'UserControlBase.setAdmin');
    try {
      return super.setAdmin(value);
    } finally {
      _$UserControlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idUsuario: ${idUsuario},
login: ${login},
email: ${email},
senha: ${senha},
status: ${status},
admin: ${admin}
    ''';
  }
}
