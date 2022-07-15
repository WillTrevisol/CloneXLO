import 'package:brasil_fields/brasil_fields.dart';
import 'package:clone_xlo_flutter/screens/signup/widgets/field_title.dart';
import 'package:clone_xlo_flutter/stores/signup_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../widgets/button/custom_button.dart';
import '../../widgets/error_box.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final SignUpStore controller = SignUpStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget> [
                  Observer(
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ErrorBox(
                          message: controller.error,
                        ),
                      );
                    }
                  ),
                  const FieldTitle(
                      title: 'Apelido',
                      subtitle: 'Como aparecerá em seus anúncios.'),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !controller.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Exemplo: Zé Jr.',
                          isDense: true,
                          errorText: controller.nameError,
                        ),
                        onChanged: controller.setName,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  const FieldTitle(
                      title: 'E-mail',
                      subtitle: 'Enviaremos um e-mail de confirmação.'),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !controller.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Exemplo: zejr@gmail.com',
                          isDense: true,
                          errorText: controller.emailError,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        onChanged: controller.setEmail,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  const FieldTitle(
                      title: 'Celular', subtitle: 'Proteja sua conta.'),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !controller.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Exemplo: (49) 99999-9999',
                          isDense: true,
                          errorText: controller.phoneError,
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                        onChanged: controller.setPhone,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  const FieldTitle(
                      title: 'Senha',
                      subtitle: 'Use letras, números e caracteres especiais.'),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !controller.loading,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            errorText: controller.passError),
                        obscureText: true,
                        onChanged: controller.setPass,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  const FieldTitle(
                      title: 'Confirmar senha', subtitle: 'Repita sua senha.'),
                  Observer(
                    builder: (_) {
                      return TextField(
                        enabled: !controller.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: controller.passConfirmError,
                        ),
                        obscureText: true,
                        onChanged: controller.setPassConfirm,
                      );
                    },
                  ),
                  Observer(
                    builder: (_) {
                      return CustomButton(
                        widget: controller.loading 
                          ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ) 
                          : const Text('CADASTRAR'),
                        backColor: controller.buttonColor,
                        onPressed: controller.signUpPressed,
                      );
                    }
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Já tem conta? ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
