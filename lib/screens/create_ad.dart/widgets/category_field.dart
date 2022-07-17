import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/create_ad_store.dart';
import '../../category/category_screen.dart';


class CategoryField extends StatelessWidget {
  const CategoryField({required this.controller, Key? key}) : super(key: key);

  final CreateAdStore controller;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
          title: Text(
            'Categoria *',
            style: controller.category == null ?
            const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.grey,
            ) :
            const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          subtitle: controller.category != null 
            ? Text(
              '${controller.category!.description}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
              ) : null,
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: () async {
            final category = await showDialog(
              context: context, 
              builder: (_) => CategoryScreen(
                showAll: false,
                categorySelected: controller.category,
              )
            );

            if (category != null) {
              controller.setCategory(category);
            }
          },
        );
      },
    );
  }
}