import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../stores/edit_account_store.dart';
import '../../stores/page_store.dart';
import '../../widgets/button/custom_button.dart';
import '../../widgets/error_box.dart';

class EditAccountScreen extends StatelessWidget {
  EditAccountScreen({Key? key}) : super(key: key);

  final EditAccountStore controller = EditAccountStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Conta'),
      ),
      body: Center(
        child: Card(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Observer(
                builder: (_) => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget> [
                    if (controller.error != null) 
                      ErrorBox(
                        message: controller.error is String ? controller.error : '',
                        radius: 16,
                      ),
                      const SizedBox(height: 8),
                    LayoutBuilder(
                      builder: (_, constraints) {
                        return IgnorePointer(
                          ignoring: controller.loading,
                          child: ToggleSwitch(
                            animate: true,
                            animationDuration: 500,
                            curve: Curves.easeOut,
                            minHeight: 45,
                            minWidth: constraints.biggest.width / 2.01,
                            labels: const <String>[
                              'Particular',
                              'Profissional',
                            ],
                            inactiveFgColor: Colors.white,
                            cornerRadius: 24,
                            onToggle: (option) {},
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Nome completo*',
                        errorText: controller.nameError,
                      ),
                      enabled: !controller.loading,
                      initialValue: controller.name,
                      onChanged: controller.setName,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Telefone *',
                        errorText: controller.phoneError,
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                      enabled: !controller.loading,
                      initialValue: controller.phone,
                      onChanged: controller.setPhone,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      obscureText: controller.obscureText,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Nova senha',
                        errorText: controller.passError,
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.obscureText
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                          ),
                          onPressed: controller.setObscureText,
                        ),
                      ),
                      enabled: !controller.loading,
                      onChanged: controller.setPasswaord,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      obscureText: controller.obscureText,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Confirmar nova senha',
                        errorText: controller.confirmPassError,
                      ),
                      enabled: !controller.loading,
                      onChanged: controller.setconfirmPassword,
                    ),
                    CustomButton(
                      widget: controller.loading ? const CircularProgressIndicator(color: Colors.white) : const Text('Salvar'),
                      borderRadius: 26,
                      backColor: controller.buttonColor,
                      onPressed: controller.onSendPressed
                    ),
                    CustomButton(
                      widget: const Text('Sair'),
                      borderRadius: 26,
                      backColor: Colors.red,
                      onPressed: () {
                        controller.logout();
                        GetIt.I.get<PageStore>().setPage(0);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
