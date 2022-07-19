import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/filter_store.dart';
import 'section_title.dart';

class OrderByField extends StatelessWidget {
  const OrderByField({required this.controller, Key? key}) : super(key: key);

  final FilterStore controller;

  @override
  Widget build(BuildContext context) {
    Widget _buildOption(String title, OrderBy option) {
      return GestureDetector(
        child: Container(
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: controller.orderBy == option ? Colors.purple : Colors.white,
            border: Border.all(
              color: Colors.purple,
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: controller.orderBy == option ? Colors.white : Colors.purple,
            ),
          ),
        ),
        onTap: () {
          controller.setOrderBy(option);
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SectionTitle(title: 'Ordernar por'),
        Observer(
          builder: (_) {
            return Row(
              children: <Widget>[
                _buildOption('Data', OrderBy.date),
                const SizedBox(width: 12),
                _buildOption('Preço', OrderBy.price),
              ],
            );
          },
        ),
      ],
    );
  }
}
