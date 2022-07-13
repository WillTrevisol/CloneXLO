import 'package:brasil_fields/brasil_fields.dart';
import 'package:clone_xlo_flutter/screens/signup/widgets/field_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/button/custom_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                  const FieldTitle(
                    title: 'Apelido', 
                    subtitle: 'Como aparecerá em seus anúncios.'
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Exemplo: Zé Jr.',
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const FieldTitle(
                    title: 'E-mail', 
                    subtitle: 'Enviaremos um e-mail de confirmação.'
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Exemplo: zejr@gmail.com',
                      isDense: true,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                  ),
                  const SizedBox(height: 16),
                  const FieldTitle(
                    title: 'Celular', 
                    subtitle: 'Proteja sua conta.'
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Exemplo: (49) 99999-9999',
                      isDense: true,
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const FieldTitle(
                    title: 'Senha', 
                    subtitle: 'Use letras, números e caracteres especiais.'
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  const FieldTitle(
                    title: 'Confirmar senha', 
                    subtitle: 'Repita sua senha.'
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    obscureText: true,
                  ),
                  CustomButton(
                    text: 'CADASTRAR',
                    onPressed: () {},
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: <Widget> [
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
              )
            ),
          ),
        ),
      ),
    );
  }
}