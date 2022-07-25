import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../stores/filter_store.dart';
import '../../stores/home_store.dart';
import '../../widgets/button/custom_button.dart';
import 'widgets/location_field.dart';
import 'widgets/orderby_field.dart';
import 'widgets/price_range_field.dart';
import 'widgets/seller_type_field.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({Key? key}) : super(key: key);

  final FilterStore controller = GetIt.I.get<HomeStore>().clonedFilter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtrar Busca'),
      ),
      body: Center(
        child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              LocationField(controller: controller),
              OrderByField(controller: controller),
              PriceRangeField(controller: controller),
              SellerTypeField(controller: controller),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Observer(
                  builder: (_) {
                    return CustomButton(
                      widget: const Text('FILTRAR'),
                      onPressed: controller.isFormValid ? 
                       () {
                        GetIt.I.get<HomeStore>().setFilter(controller);
                        Navigator.of(context).pop();
                       } :
                       null,
                      backColor: controller.buttonColor,
                      borderRadius: 24,
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
