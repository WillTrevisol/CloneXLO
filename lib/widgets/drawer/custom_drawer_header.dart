import 'package:flutter/material.dart';

import '../../screens/login/login_screen.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: DrawerHeader(
        decoration: const BoxDecoration(
          color: Colors.purple, 
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget> [
            const Icon(
              Icons.person,
              size: 34,
              color: Colors.white,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget> [
                Text(
                  'Acesse sua conta',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Clique aqui',
                style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const LoginScreen())
        );
      },
    );
  }
}