import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../stores/page_store.dart';
import 'page_tile.dart';

class PageSection extends StatelessWidget {
  PageSection({Key? key}) : super(key: key);

  final PageStore pageStore = GetIt.I.get<PageStore>();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        PageTile(
          label: 'Anúncios',
          icon: Icons.list_outlined,
          onTap: () {
            pageStore.setPage(0);
          },
          selected: pageStore.page == 0,
        ),
        PageTile(
          label: 'Inserir Anúncio',
          icon: Icons.edit_outlined,
          onTap: () {
            pageStore.setPage(1);
          },
          selected: pageStore.page == 1,
        ),
        PageTile(
          label: 'Chat',
          icon: Icons.chat_outlined,
          onTap: () {
            pageStore.setPage(2);
          },
          selected: pageStore.page == 2,
        ),
        PageTile(
          label: 'Favoritos',
          icon: Icons.favorite_border_outlined,
          onTap: () {
            pageStore.setPage(3);
          },
          selected: pageStore.page == 3,
        ),
        PageTile(
          label: 'Minha Conta',
          icon: Icons.person_outline,
          onTap: () {
            pageStore.setPage(4);
          },
          selected: pageStore.page == 4,
        ),
      ],
    );
  }
}