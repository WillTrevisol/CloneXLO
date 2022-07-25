import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../models/uf.dart';
import '../../stores/uf_city_store.dart';
import '../../widgets/error_box.dart';

class UfCityScreen extends StatefulWidget {
  const UfCityScreen({this.uf, this.showAll = false, Key? key}) : super(key: key);

  final UF? uf;
  final bool showAll;

  @override
  State<UfCityScreen> createState() => _UfCityScreenState();
}

class _UfCityScreenState extends State<UfCityScreen> {

  late UfCityStore controller;
  final TextEditingController textController = TextEditingController();
  late ReactionDisposer disposer;

  @override
  void initState() {
    controller = UfCityStore(
      uf: widget.uf,
      showAll: widget.showAll,
    );

    disposer = autorun((_) {
      if (controller.uf != null && controller.city != null) {
        Navigator.of(context).pop({'uf' : controller.uf, 'city' : controller.city});
      } else if (controller.uf?.id == -1) {
        Navigator.of(context).pop({'uf' : controller.uf});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) {
              if (controller.uf == null) {
                return const Text('Selecionar Estado');
              } else {
                return const Text('Selecionar Cidade');
              }
            }
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 32),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget> [
                  Observer(
                    builder: (_) {
                      if (controller.uf != null) {
                        return Row(
                          children: <Widget> [
                            Expanded(
                              flex: 5,
                              child: Text(
                                'Estado: ${controller.uf!.name}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.purple
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.setItem(null);
                                textController.clear();
                              }, 
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  TextField(
                    controller: textController,
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      labelText: 'Pesquisar',
                    ),
                    onChanged: controller.setSearch,
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Observer(
                      builder: (_) {
                        if (controller.error != null) {
                          return ErrorBox(
                            message: controller.error, 
                            radius: 16
                          );
                        }

                        if (controller.listFiltered.length -1 == 0) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return ListView.separated(
                          itemCount: controller.listFiltered.length,
                          itemBuilder: (context, index) {
                            return Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  controller.setItem(controller.listFiltered[index]);
                                  textController.clear();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                    controller.listFiltered[index].name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: controller.listFiltered[index].id == -1 ?
                                        FontWeight.w900 :
                                        FontWeight.w400,
                                      color: Colors.purple,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }, 
                          separatorBuilder: (_, __) => const Divider(),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}