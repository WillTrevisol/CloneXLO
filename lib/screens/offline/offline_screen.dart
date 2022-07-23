import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../stores/connectivity_store.dart';

class OfflineScreen extends StatefulWidget {
  const OfflineScreen({Key? key}) : super(key: key);

  @override
  State<OfflineScreen> createState() => _OfflineScreenState();
}

class _OfflineScreenState extends State<OfflineScreen> {

  final ConnectivityStore connectivity = GetIt.I.get<ConnectivityStore>();


  @override
  void initState() {

    when(
      (_) => connectivity.connected,
      () => Navigator.of(context).pop(), 
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('XLO'),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget> [
            Center(
              child: Text(
                'Sem conexão com a internet.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            Icon(
              Icons.cloud_off,
              size: 150,
              color: Colors.white,
            ),
            Text(
              'Por favor, verifique sua conexão\n para continuar utilizando o aplicativo.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}