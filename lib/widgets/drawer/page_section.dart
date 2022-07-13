import 'package:flutter/material.dart';

import 'page_tile.dart';

class PageSection extends StatelessWidget {
  const PageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        PageTile(
          label: 'Anúncios',
          icon: Icons.list_outlined,
          onTap: () {

          },
          selected: false,
        ),
        PageTile(
          label: 'Inserir Anúncio',
          icon: Icons.edit_outlined,
          onTap: () {

          },
          selected: true,
        ),
        PageTile(
          label: 'Chat',
          icon: Icons.chat_outlined,
          onTap: () {

          },
          selected: false,
        ),
        PageTile(
          label: 'Favoritos',
          icon: Icons.favorite_border_outlined,
          onTap: () {

          },
          selected: false,
        ),
        PageTile(
          label: 'Minha Conta',
          icon: Icons.person_outline,
          onTap: () {

          },
          selected: false,
        ),
      ],
    );
  }
}