import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'screens/base/base_screen.dart';
import 'stores/category_store.dart';
import 'stores/chat_home_store.dart';
import 'stores/connectivity_store.dart';
import 'stores/favorite_store.dart';
import 'stores/home_store.dart';
import 'stores/location_store.dart';
import 'stores/page_store.dart';
import 'stores/user_manager_store.dart';

const appId = String.fromEnvironment('APPID');
const clientKey = String.fromEnvironment('CLIENTKEY');
const oneSignalKey = String.fromEnvironment('ONESIGNALKEY');
const liveQueryUrl = String.fromEnvironment('LIVEQUERYURL');

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await initializeParse();
      await Firebase.initializeApp();
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      setupLocators();
      await oneSignalConfig();
      runApp(const CloneXLO());
    }, (
      (error, stack) => {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true)
      }
    ),
  );
}

Future<void> oneSignalConfig() async {
  OneSignal.shared.setLogLevel(OSLogLevel.none, OSLogLevel.none);
  OneSignal.shared.setLocationShared(false);
  OneSignal.shared.setAppId(oneSignalKey);
}
 
void setupLocators() {
  GetIt.I.registerSingleton(ConnectivityStore());
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(LocationStore());
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(HomeStore());
  GetIt.I.registerSingleton(ChatHomeStore());
  GetIt.I.registerSingleton(CategoryStore());
  GetIt.I.registerSingleton(FavoriteStore());
}

Future<void> initializeParse() async {
   await ParseCoreData.init(
    appId,
    'https://parseapi.back4app.com',
    clientKey: clientKey,
    liveQueryUrl: liveQueryUrl,
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