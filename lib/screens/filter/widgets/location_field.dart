import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../stores/filter_store.dart';
import '../../uf/uf_city_screen.dart';
import 'section_title.dart';

class LocationField extends StatelessWidget { 
  const LocationField({required this.controller, Key? key}) : super(key: key);
  
  final FilterStore controller;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            const SectionTitle(
              title: 'Localização',
            ),
            GestureDetector(
              onTap: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const UfCityScreen(
                    showAll: true,
                    ),
                  ),
                );
                if (result != null) {
                  controller.setUF(result['uf']);
                  controller.setCity(result['city']);
                }
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    Text(
                      controller.uf?.name ?? 'Selecionar Estado',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      size: 18,
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            if (controller.city != null) 
              GestureDetector(
                onTap: () async {
                  final result = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => UfCityScreen(
                      uf: controller.uf,
                      showAll: true,
                      ),
                    ),
                  );
                  if (result != null) {
                    controller.setUF(result['uf']);
                    controller.setCity(result['city']);
                  }
                },
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      Text(
                        controller.city?.name ?? 'Selecionar Cidade',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.purple,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      } 
    );
  }
}