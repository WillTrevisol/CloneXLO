// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recovery_pass_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RecoveryPassStore on _RecoveryPassStoreBase, Store {
  Computed<bool>? _$validEmailComputed;

  @override
  bool get validEmail =>
      (_$validEmailComputed ??= Computed<bool>(() => super.validEmail,
              name: '_RecoveryPassStoreBase.validEmail'))
          .value;
  Computed<VoidCallback?>? _$onRecoverPressedComputed;

  @override
  VoidCallback? get onRecoverPressed => (_$onRecoverPressedComputed ??=
          Computed<VoidCallback?>(() => super.onRecoverPressed,
              name: '_RecoveryPassStoreBase.onRecoverPressed'))
      .value;

  late final _$emailAtom =
      Atom(name: '_RecoveryPassStoreBase.email', context: context);

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

  late final _$loadingAtom =
      Atom(name: '_RecoveryPassStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_RecoveryPassStoreBase.error', context: context);

  @override
  dynamic get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(dynamic value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$successAtom =
      Atom(name: '_RecoveryPassStoreBase.success', context: context);

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$_RecoveryPassStoreBaseActionController =
      ActionController(name: '_RecoveryPassStoreBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_RecoveryPassStoreBaseActionController.startAction(
        name: '_RecoveryPassStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RecoveryPassStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_RecoveryPassStoreBaseActionController.startAction(
        name: '_RecoveryPassStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_RecoveryPassStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(dynamic value) {
    final _$actionInfo = _$_RecoveryPassStoreBaseActionController.startAction(
        name: '_RecoveryPassStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_RecoveryPassStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSuccess(bool value) {
    final _$actionInfo = _$_RecoveryPassStoreBaseActionController.startAction(
        name: '_RecoveryPassStoreBase.setSuccess');
    try {
      return super.setSuccess(value);
    } finally {
      _$_RecoveryPassStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
loading: ${loading},
error: ${error},
success: ${success},
validEmail: ${validEmail},
onRecoverPressed: ${onRecoverPressed}
    ''';
  }
}
