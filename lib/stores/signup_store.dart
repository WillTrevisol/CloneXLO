import 'package:clone_xlo_flutter/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../helpers/extensions.dart';
import '../models/user.dart';
import 'user_manager_store.dart';


part 'signup_store.g.dart';

// ignore: library_private_types_in_public_api
class SignUpStore = _SignUpStoreBase with _$SignUpStore;

abstract class _SignUpStoreBase with Store {
  
  @observable
  String name = '';

  @action
  void setName(String value) => name = value;

  @computed
  bool get isNameValid => name.length > 6;
  String? get nameError {

    if (name.isNotEmpty && !isNameValid) {
      return 'Nome muito curto.';
    }

    if (name.isEmpty) {
      return 'Campo obrigatório.';
    }

    return null;
  }

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get isEmailValid => email.isEmailValid();
  String? get emailError {

    if (!isEmailValid && email.isNotEmpty) {
      return 'E-mail inválido';
    }

    if (email.isEmpty) {
      return 'Campo obrigatório.';
    }

    return null;
  }

  @observable
  String phone = '';

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get isPhoneValid => phone.length >= 13;
  String? get phoneError {
    
    if (!isPhoneValid && phone.isNotEmpty) {
      return 'Número inválido';
    }

    if (phone.isEmpty) {
      return 'Campo obrigatório.';
    }

    return null;
  }

  @observable
  String pass = '';

  @action
  void setPass(String value) => pass = value;

  @computed
  bool get isPassValid => pass.length >= 6;
  String? get passError {

    if (!isPassValid && pass.isNotEmpty) {
      return 'Senha muito curta.';
    }

    if (pass.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;

  }

  @observable
  String passConfirm = '';

  @action
  void setPassConfirm(String value) => passConfirm = value;

  @computed
  bool get isPassConfirmValid => passConfirm == pass;
  String? get passConfirmError {
    
    if (!isPassConfirmValid) {
      return 'Senhas diferentes';
    }

    return null;
  }

  @computed
  bool get isFormValid => isNameValid && isEmailValid && isPhoneValid && isPassValid && isPassConfirmValid;

  @computed
  Color get buttonColor => (isFormValid && !loading) ? Colors.orange : Colors.orange.withAlpha(100);

  @computed
  VoidCallback? get signUpPressed => (isFormValid && !loading) ? _signup : null;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  dynamic error;

  @action
  void setError(dynamic value) => error = value;

  Future<void> _signup() async {
    setLoading(true);
    setError(null);

    final User user = User(
      name: name,
      phone: phone,
      email: email,
      password: pass,
    );

    try {
      final resultUser = await UserRepository().signUp(user);
      GetIt.I.get<UserManagerStore>().setUser(resultUser);
    } catch (e) {
      setError(e);
    }

    setLoading(false);
  }
}