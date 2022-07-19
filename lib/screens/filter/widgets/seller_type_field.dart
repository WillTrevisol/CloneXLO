import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/filter_store.dart';
import 'section_title.dart';

class SellerTypeField extends StatelessWidget {
  const SellerTypeField({required this.controller, Key? key}) : super(key: key);

  final FilterStore controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget> [
        const SectionTitle(title: 'Tipo de anunciante'),
        Observer(
          builder: (_) {
            return Wrap(
              runSpacing: 4,
              children: <Widget> [
                GestureDetector(
                  onTap: () {
                    if (controller.isTypeParticular) {
                      if (controller.isTypeProfessional) {
                        controller.resetSellerType(sellerTypeParticular);
                      } else {
                        controller.selectSellerType(sellerTypeProfessional);
                      }
                    } else {
                      controller.setSellerType(sellerTypeParticular);
                    }                    
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: controller.isTypeParticular ? Colors.purple : Colors.white,
                      border: Border.all(
                        color: Colors.purple,
                      ),
                    ),
                    child: Text(
                      'Particular',
                      style: TextStyle(
                        color: controller.isTypeParticular ? Colors.white : Colors.purple,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    if (controller.isTypeProfessional) {
                      if (controller.isTypeParticular) {
                        controller.resetSellerType(sellerTypeProfessional);
                      } else {
                        controller.selectSellerType(sellerTypeParticular);
                      }
                    } else {
                      controller.setSellerType(sellerTypeProfessional);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: controller.isTypeProfessional ? Colors.purple : Colors.white,
                      border: Border.all(
                        color: Colors.purple,
                      ),
                    ),
                    child: Text(
                      'Profissional',
                      style: TextStyle(
                        color: controller.isTypeProfessional ? Colors.white : Colors.purple,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ],
    );
  }
}