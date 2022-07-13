import 'package:clone_xlo_flutter/widgets/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
    
        ),
        drawer: const CustomDrawer(
          
        ),
      ),
    );
  }
}