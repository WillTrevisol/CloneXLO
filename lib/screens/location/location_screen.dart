import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../helpers/log.dart';
import '../../models/address.dart';
import '../../stores/location_store.dart';
import '../../widgets/button/custom_button.dart';
import '../uf/uf_city_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({this.showInfoDialog = false, Key? key}) : super(key: key);

  final bool showInfoDialog;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> with SingleTickerProviderStateMixin{

  bool get showInfoDialog => widget.showInfoDialog;
  late AnimationController _animationController;
  late Animation<double> _circleAnimation;
  final LocationStore locationController = GetIt.I.get<LocationStore>();

  @override
  void initState() {

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );

    _circleAnimation = Tween<double>(
      begin: 70.0,
      end: 300
    ).animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.forward(from: 0);
      }
    });

    _animationController.forward(from: 0);

    if (showInfoDialog) {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) async {
          await Geolocator.requestPermission();
          await locationController.getLocation();
        }
      );
    }

    reaction(
      (_) => locationController.exitLocationScreen, 
      (dynamic) {
        log.i(dynamic);
        Navigator.of(context).pop();
      }
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return false;
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: AnimatedBuilder(
            animation: _circleAnimation, 
            builder: (context, widget) {
              return Stack(
                children: <Widget> [
                  Observer(
                    builder: (_) {
                      
                      if (locationController.status == LocationStatus.failed) {
                        return const Positioned.fill(
                          child: Center(
                            child: Text(
                              'Opa!\n Não conseguimos te localizar. :(',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.purple,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      }


                      return Stack(
                        children: <Widget> [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: _circleAnimation.value,
                              height: _circleAnimation.value,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: _circleAnimation.value - 5,
                              height: _circleAnimation.value - 5,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.purple,
                              ),
                              child: const Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Positioned(
                    top: 55,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: const <Widget> [
                        Icon(
                          Icons.location_on,
                          color: Colors.purple,
                          size: 55,
                        ),
                        SizedBox(height: 22),
                        Text(
                          'Buscando sua\nlocalização atual',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget> [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Selecionar manualmente:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 18,
                            ),
                          ),
                        ),
                        CustomButton(
                          widget: const Text('Escolher estado'),
                          onPressed: selectManually,
                          backColor: Colors.purple, 
                          borderRadius: 26,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> selectManually() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const UfCityScreen())
    );

    if (result != null) {
      locationController.setAddress(Address(uf: result['uf'], city: result['city']));
    }
  }
}