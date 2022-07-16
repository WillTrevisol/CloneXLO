import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../screens/login/login_screen.dart';
import '../../stores/page_store.dart';
import '../../stores/user_manager_store.dart';

class CustomDrawerHeader extends StatelessWidget {
  CustomDrawerHeader({Key? key}) : super(key: key);

  final UserManagerStore userStore = GetIt.I.get<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: DrawerHeader(
        decoration: const BoxDecoration(
          color: Colors.purple,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Icon(
              Icons.person,
              size: 34,
              color: Colors.white,
            ),
            Observer(
              builder: (_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      userStore.isLoggedIn
                          ? userStore.user!.name
                          : 'Acesse sua conta',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      userStore.isLoggedIn
                          ? userStore.user!.email
                          : 'Clique aqui',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      onTap: () {
        if (userStore.isLoggedIn) {
          GetIt.I<PageStore>().setPage(4);
        }

        if (!userStore.isLoggedIn) {
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => LoginScreen()));
        }
      },
    );
  }
}
