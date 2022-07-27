import 'package:clone_xlo_flutter/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../repositories/user_repository.dart';
part 'recovery_pass_store.g.dart';

// ignore: library_private_types_in_public_api
class RecoveryPassStore = _RecoveryPassStoreBase with _$RecoveryPassStore;

abstract class _RecoveryPassStoreBase with Store {
  
  _RecoveryPassStoreBase(this.email);

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get validEmail => email.isNotEmpty && email.isEmailValid();
  String? get emailError {
    if (validEmail) {
      return null;
    }

    if (email.isEmpty) {
      return 'Campo obrigatório';
    }

    return 'E-mail inválido';
  }

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  dynamic error;

  @action
  void setError(dynamic value) => error = value;

  @observable
  bool success = false;

  @action
  void setSuccess(bool value) => success = value;

  @computed
  VoidCallback? get onRecoverPressed => validEmail ? _recover : null;

  Future<void> _recover() async {
    setLoading(true);
    setError(null);

    try {
      await UserRepository().recoverPassword(email);
      setSuccess(true);
    } catch (e) {
      setError(e.toString());
    }

    setLoading(false);
  }

}