import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../stores/connectivity_store.dart';
import '../../stores/home_store.dart';
import '../../stores/location_store.dart';
import '../../stores/page_store.dart';
import '../account/account_screen.dart';
import '../ad/ad_screen.dart';
import '../chat_home.dart/chat_home_screen.dart';
import '../create_ad.dart/create_ad_screen.dart';
import '../favorites/favorites_screen.dart';
import '../home/home_screen.dart';
import '../location/location_screen.dart';
import '../offline/offline_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();
  final PageStore pageStore = GetIt.I.get<PageStore>();
  final ConnectivityStore connectivity = GetIt.I.get<ConnectivityStore>();
  final LocationStore locationController = GetIt.I.get<LocationStore>();


  @override
  void initState() {
    reaction(
      (_) => pageStore.page,
      (int page) => pageController.jumpToPage(page),
    );

    when(
      (_) => locationController.showLocationScreen, 
      () {
        Future.delayed(const Duration(milliseconds: 50)).then(
          (value) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const LocationScreen(
                showInfoDialog: true,
              )
            ));
          }
        );
      }
    );
    
    autorun((_) {
        if (!connectivity.connected) {
          Future.delayed(const Duration(milliseconds: 50)).then(
            (_) => showDialog(
            context: context, 
            builder: (_) {
              return const OfflineScreen();
            }
          ));
        }
        oneSignalEvents();
      }
    );
    super.initState();
  }

  void oneSignalEvents() async {

    OneSignal.shared.setNotificationOpenedHandler(
      (OSNotificationOpenedResult openedResult) async {
        if (openedResult.notification.additionalData != null) {

          if (openedResult.notification.additionalData!.containsKey('adId')) {
            final ad = await HomeStore().getAdById(openedResult.notification.additionalData!['adId']);

            if (ad != null && mounted) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => AdScreen(ad: ad),)
              );
            }
          }
        }
      }
    );
    await OneSignal.shared.promptUserForPushNotificationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget> [
          const HomeScreen(),
          const CreateAdScreen(),
          const ChatHomeScreen(),
          FavoritesScreen(),
          const AccountScreen(),
        ],
      ),
    );
  }
}