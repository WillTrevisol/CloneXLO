import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../stores/create_ad_store.dart';
import '../../widgets/button/custom_button.dart';
import '../../widgets/drawer/custom_drawer.dart';
import 'widgets/category_field.dart';
import 'widgets/hide_phone_field.dart';
import 'widgets/images_field.dart';
import 'widgets/zipcode_field.dart';

class CreateAdScreen extends StatelessWidget {
  CreateAdScreen({Key? key}) : super(key: key);

  final CreateAdStore controller = CreateAdStore();

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(
      fontWeight: FontWeight.w800,
      color: Colors.grey,
      fontSize: 18,
    );

    const contentPadding = EdgeInsets.fromLTRB(16, 10, 12, 10);

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Criar Anúncio'),
      ),
      body: Center(
        child: Card(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ImagesField(controller: controller),
                Observer(builder: (_) {
                  return TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Título *',
                      labelStyle: labelStyle,
                      contentPadding: contentPadding,
                      errorText: controller.titleError,
                    ),
                    onChanged: controller.setTitle,
                  );
                }),
                Observer(
                  builder: (_) {
                    return TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Descrição *',
                        labelStyle: labelStyle,
                        contentPadding: contentPadding,
                        errorText: controller.descriptionError,
                      ),
                      onChanged: controller.setDescription,
                      maxLines: null,
                    );
                  },
                ),
                CategoryField(controller: controller),
                ZipCodeField(createAdController: controller),
                Observer(
                  builder: (_) {
                    return TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Preço *',
                        labelStyle: labelStyle,
                        contentPadding: contentPadding,
                        prefixText: 'R\$ ',
                        errorText: controller.priceError,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: controller.setPriceText,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CentavosInputFormatter()
                      ],
                    );
                  },
                ),
                HidePhoneField(controller: controller),
                SizedBox(
                  height: 70,
                  child: Observer(
                    builder: (_) {
                      return GestureDetector(
                        onTap: controller.invalidSendPressed,
                        child: CustomButton(
                          widget: const Text('Enviar'),
                          backColor: controller.colorButton,
                          borderRadius: 0,
                          onPressed: controller.sendPressed,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
