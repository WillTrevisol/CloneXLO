import 'package:clone_xlo_flutter/screens/create_ad.dart/create_ad_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../stores/connectivity_store.dart';
import '../../stores/page_store.dart';
import '../account/account_screen.dart';
import '../favorites/favorites_screen.dart';
import '../home/home_screen.dart';
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

  @override
  void initState() {
    reaction(
      (_) => pageStore.page,
      (int page) => pageController.jumpToPage(page),
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
      }
    );
    super.initState();
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
          Container(color: Colors.red),
          FavoritesScreen(),
          const AccountScreen(),
        ],
      ),
    );
  }
}