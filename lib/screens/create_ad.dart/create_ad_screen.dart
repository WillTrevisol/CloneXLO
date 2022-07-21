import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../models/ad.dart';
import '../../stores/create_ad_store.dart';
import '../../stores/page_store.dart';
import '../../widgets/button/custom_button.dart';
import '../../widgets/drawer/custom_drawer.dart';
import '../../widgets/error_box.dart';
import 'widgets/category_field.dart';
import 'widgets/hide_phone_field.dart';
import 'widgets/images_field.dart';
import 'widgets/zipcode_field.dart';

class CreateAdScreen extends StatefulWidget {
  const CreateAdScreen({this.ad, Key? key}) : super(key: key);

  final Ad? ad;

  @override
  State<CreateAdScreen> createState() => _CreateAdScreenState();
}

class _CreateAdScreenState extends State<CreateAdScreen> {
  late CreateAdStore controller;
  late bool editing;

  @override
  void initState() {
    controller = CreateAdStore(widget.ad);
    editing = widget.ad != null;

    when(
      (_) => controller.savedAd, 
      () => GetIt.I.get<PageStore>().setPage(0),
    );
      
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(
      fontWeight: FontWeight.w800,
      color: Colors.grey,
      fontSize: 18,
    );

    const contentPadding = EdgeInsets.fromLTRB(16, 10, 12, 10);

    return Scaffold(
      drawer: editing ? null : const CustomDrawer(),
      appBar: AppBar(
        title: Text(editing ? 'Editar Anúncio' : 'Criar Anúncio'),
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
            child: Observer(
              builder: (_) {

                if (controller.loading) {
                  return Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget> [
                        Text(
                          'Salvando anúncio...',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.purple,
                          ),
                        ),
                        SizedBox(height: 12),
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ImagesField(controller: controller),
                    Observer(
                      builder: (_) {
                        return TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Título *',
                            labelStyle: labelStyle,
                            contentPadding: contentPadding,
                            errorText: controller.titleError,
                          ),
                          initialValue: controller.title,
                          onChanged: controller.setTitle,
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Descrição *',
                            labelStyle: labelStyle,
                            contentPadding: contentPadding,
                            errorText: controller.descriptionError,
                          ),
                          initialValue: controller.description,
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
                          initialValue: controller.priceText,
                          onChanged: controller.setPriceText,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CentavosInputFormatter()
                          ],
                        );
                      },
                    ),
                    HidePhoneField(controller: controller),
                    ErrorBox(
                      message: controller.error, 
                      radius: 0,
                    ),
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
                );
              },
            )
          ),
        ),
      ),
    );
  }
}
