import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../stores/recovery_pass_store.dart';
import '../../widgets/button/custom_button.dart';
import '../../widgets/error_box.dart';
import '../signup/widgets/field_title.dart';

class RecoveryScreen extends StatefulWidget {
  const RecoveryScreen({required this.email, Key? key}) : super(key: key);

  final String email;

  @override
  State<RecoveryScreen> createState() => _RecoveryScreenState();
}

class _RecoveryScreenState extends State<RecoveryScreen> {
  late RecoveryPassStore controller;
  late ReactionDisposer disposer;

  @override
  void initState() {
    
    controller = RecoveryPassStore(widget.email);

    disposer = reaction(
      (_) => controller.success,
      (_) {
        if (controller.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Link para recuperação enviado para E-mail informado.',
              ),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Recuperar Senha'),
        ),
        body: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget> [
                Observer(
                  builder: (_) {
                    if (controller.error != null) {
                      return ErrorBox(
                        message: controller.error,
                        radius: 16,
                      );
                    }

                    return Container();
                  }
                ),

                const FieldTitle(
                  title: 'Confirme seu E-mail',
                  subtitle: 'Enviaremos um link para recuperação.',
                ),
                const SizedBox(height: 8),
                Observer(
                  builder: (_) {
                    return TextFormField(
                      initialValue: controller.email,
                      enabled: !controller.loading,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                        errorText: controller.emailError,
                        hintText: 'zejr@email.com',
                      ),
                      onChanged: controller.setEmail,
                    );
                  },
                ),
                const SizedBox(height: 16),
                Observer(
                  builder: (_) {
                    return CustomButton(
                      widget: !controller.loading 
                        ? const Text('Enviar')  
                        : const CircularProgressIndicator(color: Colors.white), 
                      borderRadius: 26, 
                      backColor: Colors.orange, 
                      onPressed: controller.onRecoverPressed,
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}