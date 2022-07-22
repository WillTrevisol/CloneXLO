import 'package:clone_xlo_flutter/widgets/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../stores/favorite_store.dart';
import '../../widgets/empty_card.dart';
import 'widgets/favorite_tile.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({this.hideDrawer = false, Key? key}) : super(key: key);

  final bool hideDrawer;
  final FavoriteStore favoriteController = GetIt.I.get<FavoriteStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: hideDrawer ? null : const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: Observer(
        builder: (_) {
          if (favoriteController.favoriteList.isEmpty) {
            return const EmptyCard(
              message: 'Nenum anúncio favoritado.'
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(2),
            itemCount: favoriteController.favoriteList.length,
            itemBuilder: (_, index) {
              return FavoriteTile(ad: favoriteController.favoriteList[index]);
            }
          );
        },
      ),
    );
  }
}