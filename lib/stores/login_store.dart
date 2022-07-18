import 'package:clone_xlo_flutter/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../helpers/extensions.dart';
import 'user_manager_store.dart';
part 'login_store.g.dart';

// ignore: library_private_types_in_public_api
class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get isEmailValid => email.isEmailValid();
  String? get emailError => email.isEmpty || isEmailValid ? null : 'E-mail inválido';

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get isPasswordValid => password.length >= 4;
  String? get passwordError => isPasswordValid || password.isEmpty ? null : 'Senha inválida';

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;

  Color get buttonColor => isFormValid && !loading ? Colors.orange : Colors.orange.withAlpha(100);

  @computed
  VoidCallback? get signInPressed => isFormValid && !loading ? _login : null;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  dynamic error;

  @action
  void setError(dynamic value) => error = value;
  
  Future<void> _login() async {
    setLoading(true);

    try {
      final user = await UserRepository().loginEmail(email, password);
      GetIt.I<UserManagerStore>().setUser(user);
    } catch(e) {
      setError(e);
    }

    setLoading(false);
  }
}