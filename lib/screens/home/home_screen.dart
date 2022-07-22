import 'package:clone_xlo_flutter/widgets/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../stores/home_store.dart';
import '../../widgets/empty_card.dart';
import 'widgets/ad_button.dart';
import 'widgets/ad_tile.dart';
import 'widgets/search_dialog.dart';
import 'widgets/top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeStore controller = GetIt.I.get<HomeStore>();

  final ScrollController scrollController = ScrollController();

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
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget> [
                  Observer(
                    builder: (_) {
                      if (controller.error != null) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget> [
                            const Icon(
                              Icons.error,
                              color: Colors.white,
                              size: 100,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Ocorreu um erro.\n${controller.error}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        );
                      }
                  
                      if (controller.showProgress) {
                        return const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        );
                      }
                  
                      if (controller.adList.isEmpty) {
                        return const EmptyCard(
                          message: 'Nenhum anúncio encontrado.',
                        );
                      }
                  
                      return ListView.builder(
                        itemCount: controller.itemCount,
                        controller: scrollController,
                        itemBuilder: (_, index) {
                          if (index < controller.adList.length) {
                            return AdTile(ad: controller.adList[index]);
                          }
                          
                          controller.loadNextPage();
                          return const SizedBox(
                            height: 10,
                            child: LinearProgressIndicator(),
                          );
                        },
                      );
                    },
                  ),
                  Positioned(
                    bottom: -50,
                    child: CreateAdButton(
                      scrollController: scrollController,
                    ),
                  ),
                ],
              ),
            ),
            
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
