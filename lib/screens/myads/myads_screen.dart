import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../stores/myads_store.dart';
import '../../widgets/button/custom_button.dart';
import '../../widgets/error_box.dart';
import 'widgets/active_tile.dart';
import '../../widgets/empty_card.dart';
import 'widgets/pending_tile.dart';
import 'widgets/sold_tile.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({this.initialPage = 0, Key? key}) : super(key: key);

  final int initialPage;

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> with SingleTickerProviderStateMixin {

  late TabController tabController;
  final MyAdsStore controller = MyAdsStore();

  @override
  void initState() {
    tabController =  TabController(
    length: 3,
    initialIndex: widget.initialPage,
    vsync: this,
  );

    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Anúncios'),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.orange,
          tabs: const <Widget> [
            Tab(child: Text('ATIVOS')),
            Tab(child: Text('PENDENTES')),
            Tab(child: Text('VENDIDOS')),
          ],
        ),
      ),
      body: Observer(
        builder: (_) {
          if (controller.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }

          if (controller.error != null) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  ErrorBox(
                    message: controller.error, 
                    radius: 16,
                  ),
                  CustomButton(
                    widget: const Text('Tentar novamente'),
                    backColor: Colors.orange, 
                    borderRadius: 26, 
                    onPressed: () {
                      controller.refresh();
                    },
                  )
                ],
              ),
            );
          }

          return TabBarView(
            controller: tabController,
            children: <Widget> [
              Observer(
                builder: (_) {
                  if (controller.activeAds.isEmpty) {
                    return const EmptyCard(
                      message: 'Nenhum anúncio ativo foi encontrado.',
                    );
                  }

                  return ListView.builder(
                    itemCount: controller.activeAds.length,
                    itemBuilder: (_, index) {
                      return ActiveTile(ad: controller.activeAds[index], controller: controller);
                    }
                  );
                }
              ),
              Observer(
                builder: (_) {
                  if (controller.pendingAds.isEmpty) {
                    return const EmptyCard(
                      message: 'Nenhum anúncio pendente foi encontrado.',
                    );
                  }

                  return ListView.builder(
                    itemCount: controller.pendingAds.length,
                    itemBuilder: (_, index) {
                      return PendingTile(ad: controller.pendingAds[index]);
                    }
                  );
                }
              ),
              Observer(
                builder: (_) {
                  if (controller.soldAds.isEmpty) {
                    return const EmptyCard(
                      message: 'Nenhum anúncio vendido foi encontrado.',
                    );
                  }

                  return ListView.builder(
                    itemCount: controller.soldAds.length,
                    itemBuilder: (_, index) {
                      return SoldTile(ad: controller.soldAds[index], controller: controller);
                    }
                  );
                }
              ),
            ],
          );
        }
      )
    );
  }
}