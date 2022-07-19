import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../stores/home_store.dart';
import '../../category/category_screen.dart';
import '../../filter/filter_screen.dart';
import 'bar_button.dart';

class TopBar extends StatelessWidget {
  TopBar({Key? key}) : super(key: key);

  final HomeStore controller = GetIt.I.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Row(
          children: <Widget> [
            BarButton(
              label: controller.category?.description ?? 'Categorias',
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              onTap: () async {
                final category = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => CategoryScreen(
                      showAll: true,
                      categorySelected: controller.category,
                    ),
                  ),
                );
                if (category != null) {
                  controller.setCategory(category);
                }
              },
            ),
            BarButton(
              label: 'Filtros',
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade400),
                  left: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => FilterScreen())
                );
              },
            ),
          ],
        );
      } 
    );
  }
}