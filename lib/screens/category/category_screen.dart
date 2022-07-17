import 'package:clone_xlo_flutter/widgets/error_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../models/category.dart';
import '../../stores/category_store.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({this.categorySelected, this.showAll = true, Key? key}) : super(key: key);

  final Category? categorySelected;
  final bool showAll;
  final CategoryStore controller = GetIt.I.get<CategoryStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.fromLTRB(32, 12, 32, 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: Observer(
            builder: (_) {
              if (controller.errorMessage != null) {
                return ErrorBox(
                  message: controller.errorMessage,
                  radius: 12,
                  );
              }

              if (controller.categoriesList.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final categories = showAll ? controller.allCategoryList : controller.categoriesList;
              return ListView.separated(
                itemCount: categories.length,
                separatorBuilder: (context, index) {
                  return const Divider(height: 0.1, color: Colors.grey);
                },
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pop(category);
                    },
                    child: Container(
                      height: 50,
                      color: category.id == categorySelected?.id ? Colors.purple.withAlpha(50) : null,
                      child: Center(
                        child: Text(
                          '${category.description}',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ),
                  );
                },  
              );
            },
          ),
        ),
      ),
    );
  }
}