import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/create_ad_store.dart';
import '../../../stores/zipcode_store.dart';
import '../../../widgets/error_box.dart';

class ZipCodeField extends StatelessWidget {
  ZipCodeField({required this.createAdController, Key? key})
      : controller = createAdController.zipCodeController,
        super(key: key);

  final CreateAdStore createAdController;
  final ZipCodeStore controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Observer(
          builder: (_) {
            return TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
              decoration: InputDecoration(
                labelText: 'CEP *',
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
                errorText: createAdController.addressError,
              ),
              initialValue: controller.zipCode,
              onChanged: controller.setZipCode,
            );
          },
        ),
        Observer(builder: (_) {
          if (controller.address == null &&
              controller.error == null &&
              !controller.loading) {
            return Container();
          }

          if (controller.loading) {
            return const LinearProgressIndicator();
          }

          if (controller.error != null) {
            return ErrorBox(
              message: controller.error,
              radius: 0,
            );
          }

          final address = controller.address;

          return Container(
            color: Colors.purple.withAlpha(150),
            height: 50,
            width: double.maxFinite,
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: Text(
              'Localização: ${address?.district} - ${address?.city?.name} - ${address?.uf?.initials}.',
              textAlign: TextAlign.center,
            ),
          );
        }),
      ],
    );
  }
}
