import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../stores/myads_store.dart';
import 'widgets/active_tile.dart';
import 'widgets/pending_tile.dart';
import 'widgets/sold_tile.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({Key? key}) : super(key: key);

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
      body: TabBarView(
        controller: tabController,
        children: <Widget> [
          Observer(
            builder: (_) {
              if (controller.activeAds.isEmpty) {
                return const Center(
                  child: Text(
                    'Nenhum anúncio encontrado.'
                  ),
                ); 
              }

              return ListView.builder(
                itemCount: controller.activeAds.length,
                itemBuilder: (_, index) {
                  return ActiveTile(ad: controller.activeAds[index]);
                }
              );
            }
          ),
          Observer(
            builder: (_) {
              if (controller.pendingAds.isEmpty) {
                return const Center(
                  child: Text(
                    'Nenhum anúncio encontrado.'
                  ),
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
                return const Center(
                  child: Text(
                    'Nenhum anúncio encontrado.'
                  ),
                ); 
              }

              return ListView.builder(
                itemCount: controller.soldAds.length,
                itemBuilder: (_, index) {
                  return SoldTile(ad: controller.soldAds[index]);
                }
              );
            }
          ),
        ],
      ),
    );
  }
}