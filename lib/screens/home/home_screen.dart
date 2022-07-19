import 'package:clone_xlo_flutter/widgets/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../stores/home_store.dart';
import 'widgets/search_dialog.dart';
import 'widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeStore controller = GetIt.I.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: Observer(builder: (_) {
            if (controller.search.isEmpty) {
              return Container();
            }
            return GestureDetector(
              onTap: () => openSearch(context),
              child: LayoutBuilder(
                builder: (_, constraints) {
                  return SizedBox(
                    width: constraints.maxWidth,
                    child: Text(
                      controller.search,
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            );
          }),
          actions: <Widget>[
            Observer(
              builder: (_) {
                if (controller.search.isEmpty) {
                  return IconButton(
                    onPressed: () {
                      openSearch(context);
                    },
                    icon: const Icon(Icons.search),
                  );
                }
                return IconButton(
                  onPressed: () => controller.setSearch(''),
                  icon: const Icon(Icons.close),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget> [
            TopBar(),
          ],
        ),
      ),
    );
  }

  void openSearch(BuildContext context) async {
    final search = await showDialog(
        context: context,
        builder: (_) {
          return SearchDialog(currentSearch: controller.search);
        });

    if (search != null) {
      controller.setSearch(search);
    }
  }
}
