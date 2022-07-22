import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../screens/login/login_screen.dart';
import '../../stores/page_store.dart';
import '../../stores/user_manager_store.dart';
import 'page_tile.dart';

class PageSection extends StatelessWidget {
  PageSection({Key? key}) : super(key: key);

  final PageStore pageController = GetIt.I.get<PageStore>();
  final UserManagerStore userController = GetIt.I.get<UserManagerStore>();


  @override
  Widget build(BuildContext context) {

    Future<void> _verifyLoginAndSetPage(int page) async {
      if (userController.isLoggedIn) {
        pageController.setPage(page);
      } else {
        final result = await Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const LoginScreen())
        );

        if (result != null && result) {
          pageController.setPage(page);
        }
      }
    }

    return Column(
      children: <Widget> [
        PageTile(
          label: 'Anúncios',
          icon: Icons.list_outlined,
          onTap: () {
            _verifyLoginAndSetPage(0);
          },
          selected: pageController.page == 0,
        ),
        PageTile(
          label: 'Inserir Anúncio',
          icon: Icons.edit_outlined,
          onTap: () {
            _verifyLoginAndSetPage(1);
          },
          selected: pageController.page == 1,
        ),
        PageTile(
          label: 'Chat',
          icon: Icons.chat_outlined,
          onTap: () {
            _verifyLoginAndSetPage(2);
          },
          selected: pageController.page == 2,
        ),
        PageTile(
          label: 'Favoritos',
          icon: Icons.favorite_border_outlined,
          onTap: () {
            _verifyLoginAndSetPage(3);
          },
          selected: pageController.page == 3,
        ),
        PageTile(
          label: 'Minha Conta',
          icon: Icons.person_outline,
          onTap: () {
            _verifyLoginAndSetPage(4);
          },
          selected: pageController.page == 4,
        ),
      ],
    );
  }
}