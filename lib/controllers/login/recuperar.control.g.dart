// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recuperar.control.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecuperarLoginControl on RecuperarLoginControlBase, Store {
  Computed<bool> _$isValidFormComputed;

  @override
  bool get isValidForm =>
      (_$isValidFormComputed ??= Computed<bool>(() => super.isValidForm,
              name: 'RecuperarLoginControlBase.isValidForm'))
          .value;

  final _$processingAtom = Atom(name: 'RecuperarLoginControlBase.processing');

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

  final _$confirmEnvioAsyncAction =
      AsyncAction('RecuperarLoginControlBase.confirmEnvio');

  @override
  Future confirmEnvio() {
    return _$confirmEnvioAsyncAction.run(() => super.confirmEnvio());
  }

  final _$RecuperarLoginControlBaseActionController =
      ActionController(name: 'RecuperarLoginControlBase');

  @override
  bool validateAndSave() {
    final _$actionInfo = _$RecuperarLoginControlBaseActionController
        .startAction(name: 'RecuperarLoginControlBase.validateAndSave');
    try {
      return super.validateAndSave();
    } finally {
      _$RecuperarLoginControlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
processing: ${processing},
isValidForm: ${isValidForm}
    ''';
  }
}
