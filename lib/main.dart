import 'package:clone_xlo_flutter/stores/page_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'screens/base/base_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(const CloneXLO());
}
 
void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
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
      debugShowCheckedModeBanner: false,
      title: 'XLO',
      home: const BaseScreen(),
      theme: ThemeData(
        primaryColor: Colors.purple,
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: const AppBarTheme(
          color: Colors.purple,
          elevation: 0,
        ),
      ),
    );
  }
}