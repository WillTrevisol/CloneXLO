import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/zipcode_store.dart';
import '../../../widgets/error_box.dart';

class ZipCodeField extends StatelessWidget {
  ZipCodeField({Key? key}) : super(key: key);

  final ZipCodeStore controller = ZipCodeStore();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CepInputFormatter(),
          ],
          decoration: const InputDecoration(
            labelText: 'CEP *',
            labelStyle: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.grey,
              fontSize: 18,
            ),
            contentPadding: EdgeInsets.fromLTRB(16, 10, 12, 10),
          ),
          onChanged: controller.setZipCode,
        ),
        Observer(
          builder: (_) {
            if (controller.address == null && controller.error == null && !controller.loading) {
              return Container();
            } 

            if (controller.loading) {
              return const LinearProgressIndicator();
            } 

            if (controller.error != null) {
              return ErrorBox(
                message: controller.error,
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
          }
        ),
      ],
    );
  }
}