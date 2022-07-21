import 'package:clone_xlo_flutter/screens/create_ad.dart/create_ad_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../stores/page_store.dart';
import '../account/account_screen.dart';
import '../home/home_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();

  final PageStore pageStore = GetIt.I.get<PageStore>();

  @override
  void initState() {
    reaction(
      (_) => pageStore.page,
      (int page) => pageController.jumpToPage(page),
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
          Container(color: Colors.black),
          const AccountScreen(),
        ],
      ),
    );
  }
}