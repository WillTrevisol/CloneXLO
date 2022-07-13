import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'screens/base/base_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  runApp(const CloneXLO());
}

Future<void> initializeParse() async {
   await Parse().initialize(
    'TJCmK4ruAvD1yL58A4SbOjjs9akDClbsnTTIJHpJ',
    'https://parseapi.back4app.com',
    clientKey: 'YKA4Fvg50zoPxSLAzgQtOzmj4gLttmJ3iUenAAMq',
    autoSendSessionId: true,
    debug: true,
  );
}

class CloneXLO extends StatelessWidget {
  const CloneXLO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      home: BaseScreen(),
    );
  }
}