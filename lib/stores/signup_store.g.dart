// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpStore on _SignUpStoreBase, Store {
  Computed<bool>? _$isNameValidComputed;

  @override
  bool get isNameValid =>
      (_$isNameValidComputed ??= Computed<bool>(() => super.isNameValid,
              name: '_SignUpStoreBase.isNameValid'))
          .value;
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_SignUpStoreBase.isEmailValid'))
          .value;
  Computed<bool>? _$isPhoneValidComputed;

  @override
  bool get isPhoneValid =>
      (_$isPhoneValidComputed ??= Computed<bool>(() => super.isPhoneValid,
              name: '_SignUpStoreBase.isPhoneValid'))
          .value;
  Computed<bool>? _$isPassValidComputed;

  @override
  bool get isPassValid =>
      (_$isPassValidComputed ??= Computed<bool>(() => super.isPassValid,
              name: '_SignUpStoreBase.isPassValid'))
          .value;
  Computed<bool>? _$isPassConfirmValidComputed;

  @override
  bool get isPassConfirmValid => (_$isPassConfirmValidComputed ??=
          Computed<bool>(() => super.isPassConfirmValid,
              name: '_SignUpStoreBase.isPassConfirmValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignUpStoreBase.isFormValid'))
          .value;
  Computed<Color>? _$buttonColorComputed;

  @override
  Color get buttonColor =>
      (_$buttonColorComputed ??= Computed<Color>(() => super.buttonColor,
              name: '_SignUpStoreBase.buttonColor'))
          .value;
  Computed<VoidCallback?>? _$signUpPressedComputed;

  @override
  VoidCallback? get signUpPressed => (_$signUpPressedComputed ??=
          Computed<VoidCallback?>(() => super.signUpPressed,
              name: '_SignUpStoreBase.signUpPressed'))
      .value;

  late final _$nameAtom = Atom(name: '_SignUpStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_SignUpStoreBase.email', context: context);

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

  late final _$phoneAtom =
      Atom(name: '_SignUpStoreBase.phone', context: context);

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$passAtom = Atom(name: '_SignUpStoreBase.pass', context: context);

  @override
  String get pass {
    _$passAtom.reportRead();
    return super.pass;
  }

  @override
  set pass(String value) {
    _$passAtom.reportWrite(value, super.pass, () {
      super.pass = value;
    });
  }

  late final _$passConfirmAtom =
      Atom(name: '_SignUpStoreBase.passConfirm', context: context);

  @override
  String get passConfirm {
    _$passConfirmAtom.reportRead();
    return super.passConfirm;
  }

  @override
  set passConfirm(String value) {
    _$passConfirmAtom.reportWrite(value, super.passConfirm, () {
      super.passConfirm = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_SignUpStoreBase.loading', context: context);

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

  late final _$_SignUpStoreBaseActionController =
      ActionController(name: '_SignUpStoreBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setPass');
    try {
      return super.setPass(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassConfirm(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setPassConfirm');
    try {
      return super.setPassConfirm(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
phone: ${phone},
pass: ${pass},
passConfirm: ${passConfirm},
loading: ${loading},
isNameValid: ${isNameValid},
isEmailValid: ${isEmailValid},
isPhoneValid: ${isPhoneValid},
isPassValid: ${isPassValid},
isPassConfirmValid: ${isPassConfirmValid},
isFormValid: ${isFormValid},
buttonColor: ${buttonColor},
signUpPressed: ${signUpPressed}
    ''';
  }
}
