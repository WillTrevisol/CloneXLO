import 'package:brasil_fields/brasil_fields.dart';
import 'package:clone_xlo_flutter/stores/create_ad_store.dart';
import 'package:clone_xlo_flutter/widgets/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/images_field.dart';

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
      body: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
            ImagesField(controller: controller),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Título *',
                labelStyle: labelStyle,
                contentPadding: contentPadding,
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Descrição *',
                labelStyle: labelStyle,
                contentPadding: contentPadding,
              ),
              maxLines: null,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'CEP *',
                labelStyle: labelStyle,
                contentPadding: contentPadding,
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Preço *',
                labelStyle: labelStyle,
                contentPadding: contentPadding,
                prefixText: 'R\$ ',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CentavosInputFormatter()
              ],
            ),
          ],
        ),
      ),
    );
  }
}