import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'screens/base/base_screen.dart';
import 'stores/category_store.dart';
import 'stores/home_store.dart';
import 'stores/page_store.dart';
import 'stores/user_manager_store.dart';

const appId = String.fromEnvironment('APPID');
const clientKey = String.fromEnvironment('CLIENTKEY');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(const CloneXLO());
}
 
void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(HomeStore());
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(CategoryStore());
}

Future<void> initializeParse() async {
   await ParseCoreData.init(
    appId,
    'https://parseapi.back4app.com',
    clientKey: clientKey,
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
          centerTitle: true,
        ),
        cardTheme: CardTheme(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.symmetric(horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
        )
      ),
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}