// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.control.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginPageControl on LoginPageControlBase, Store {
  Computed<bool> _$isValidLoginFormComputed;

  @override
  bool get isValidLoginForm => (_$isValidLoginFormComputed ??= Computed<bool>(
          () => super.isValidLoginForm,
          name: 'LoginPageControlBase.isValidLoginForm'))
      .value;

  final _$processingAtom = Atom(name: 'LoginPageControlBase.processing');

  @override
  bool get processing {
    _$processingAtom.reportRead();
    return super.processing;
  }

  @override
  set processing(bool value) {
    _$processingAtom.reportWrite(value, super.processing, () {
      super.processing = value;
    });
  }

  final _$confirmLoginAsyncAction =
      AsyncAction('LoginPageControlBase.confirmLogin');

  @override
  Future confirmLogin() {
    return _$confirmLoginAsyncAction.run(() => super.confirmLogin());
  }

  final _$confirmCadastroAsyncAction =
      AsyncAction('LoginPageControlBase.confirmCadastro');

  @override
  Future confirmCadastro() {
    return _$confirmCadastroAsyncAction.run(() => super.confirmCadastro());
  }

  final _$LoginPageControlBaseActionController =
      ActionController(name: 'LoginPageControlBase');

  @override
  bool validateAndSave() {
    final _$actionInfo = _$LoginPageControlBaseActionController.startAction(
        name: 'LoginPageControlBase.validateAndSave');
    try {
      return super.validateAndSave();
    } finally {
      _$LoginPageControlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
processing: ${processing},
isValidLoginForm: ${isValidLoginForm}
    ''';
  }
}
