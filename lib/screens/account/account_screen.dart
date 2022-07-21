import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../stores/user_manager_store.dart';
import '../../widgets/drawer/custom_drawer.dart';
import '../myads/myads_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Minha conta'),
      ),
      body: Center(
        child: Card(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.symmetric(horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget> [
              SizedBox(
                height: 140,
                child: Stack(
                  children: <Widget> [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            GetIt.I.get<UserManagerStore>().user!.name,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.purple,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            GetIt.I.get<UserManagerStore>().user!.email!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      widthFactor: 5,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'EDITAR',
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  'Meus anúncios',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const MyAdsScreen())
                  );
                },
              ),
               ListTile(
                title: const Text(
                  'Favoritos',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                onTap: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}