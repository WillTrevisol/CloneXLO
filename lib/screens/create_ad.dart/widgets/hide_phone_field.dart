import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/create_ad_store.dart';

class HidePhoneField extends StatelessWidget {
  const HidePhoneField({required this.controller, Key? key}) : super(key: key);

  final CreateAdStore controller;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            children: <Widget> [
              Checkbox(
                value: controller.hidePhone,
                onChanged: controller.setHidePhone,
              ),
              const Expanded(
                child: Text(
                  'Ocultar telefone neste anúncio.',
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}