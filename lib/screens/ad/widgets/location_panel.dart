import 'package:flutter/material.dart';

import '../../../models/ad.dart';

class LocationPanel extends StatelessWidget {
  const LocationPanel({required this.ad, Key? key}) : super(key: key);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        const Padding(
          padding: EdgeInsets.only(top: 18, bottom: 18),
          child: Text(
            'Localização',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          children: <Widget> [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget> [
                  Text('CEP'),
                  SizedBox(height: 12),
                  Text('Município'),
                  SizedBox(height: 12),
                  Text('Bairro'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget> [
                  Text(ad.address?.zipCode ?? ''),
                  const SizedBox(height: 12),
                  Text(ad.address?.city?.name ?? ''),
                  const SizedBox(height: 12),
                  Text(ad.address!.district!.isEmpty ? 'Não informado.' : ad.address!.district!),
                ],
              )
            ),
          ],
        ),
      ],
    );
  }
}