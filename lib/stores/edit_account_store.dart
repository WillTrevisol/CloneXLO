import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/user.dart';
import '../repositories/user_repository.dart';
import 'user_manager_store.dart';
part 'edit_account_store.g.dart';

// ignore: library_private_types_in_public_api
class EditAccountStore = _EditAccountStoreBase with _$EditAccountStore;

abstract class _EditAccountStoreBase with Store {

  _EditAccountStoreBase() {
    user = userController.user!;

    userType = user.type;
    name = user.name;
    phone = user.phone;
  }

  late User user;

  
  final UserManagerStore userController = GetIt.I.get<UserManagerStore>();
  
  @observable
  UserType? userType = UserType.particular;

  @action
  void setUserType(int value) => userType = UserType.values[value];

  @observable
  String name = '';

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name.isNotEmpty && name.length >= 6;
  String? get nameError {
    if (nameValid || name.isEmpty) {
      return null;
    }

    return 'Digite seu nome completo';
  }

  @observable
  String phone = '';

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone.isNotEmpty && phone.length >= 14;
  String? get phoneError {
    if (phoneValid || phone.isEmpty) {
      return null;
    }

    return 'Telefone inválido'; 
  }

  @observable
  String password = '';

  @action
  void setPasswaord(String value) => password = value;

  @computed
  bool get passValid => password.isEmpty || password.length >= 6;
  String? get passError {
    if (passValid || password.isEmpty) {
      return null;
    }

    return 'Senha muito curta';
  }

  @observable
  String confirmPassword = '';

  @action
  void setconfirmPassword(String value) => confirmPassword = value;

  @computed
  bool get confirmPassValid => confirmPassword == password;
  String? get confirmPassError {
    if (confirmPassValid) {
      return null;
    }

    return 'Senhas não são iguais';
  }

  @observable
  bool obscureText = true;

  @action
  void setObscureText() => obscureText = !obscureText;

  bool get isFormValid => nameValid && phoneValid && passValid && confirmPassValid;

  @computed
  VoidCallback? get onSendPressed =>  (isFormValid && !loading) ? _send : null;

  @computed
  Color get buttonColor => (isFormValid && !loading) ? Colors.orange : Colors.orange.withAlpha(100);

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  dynamic error;

  @action
  void setError(dynamic value) => error = value;

  Future<void> _send() async {
    setLoading(true);
    setError(null);

    user.name = name;
    user.phone = phone;
    user.type = user.type;

    if (password.isNotEmpty) {
      user.password = password;
    }

    user.password == null;
    try {
      await UserRepository().save(user);
      userController.setUser(user);
    } catch (e) {
      setError(e);
    }

    setLoading(false);
  }

  Future<void> logout() async {

    await userController.logout();

  }
}