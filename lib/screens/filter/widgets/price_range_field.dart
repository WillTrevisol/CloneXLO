import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/filter_store.dart';
import 'price_field.dart';
import 'section_title.dart';

class PriceRangeField extends StatelessWidget {
  const PriceRangeField({required this.controller, Key? key}) : super(key: key);

  final FilterStore controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SectionTitle(title: 'Preço'),
        Row(
          children: <Widget>[
            PriceField(
              labelText: 'Min',
              onChanged: controller.setMinPrice,
              initialValue: controller.minPrice,
            ),
            const SizedBox(width: 12),
            PriceField(
              labelText: 'Max',
              onChanged: controller.setMaxPrice,
              initialValue: controller.maxPrice,
            ),
          ],
        ),
        Observer(
          builder: (_) {
            if (controller.priceError != null) {
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  controller.priceError!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              );
            }

            return Container();
          },
        ),
      ],
    );
  }
}
