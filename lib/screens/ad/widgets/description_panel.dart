import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../models/ad.dart';

class DescriptionPanel extends StatelessWidget {
  const DescriptionPanel({required this.ad, Key? key}) : super(key: key);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        const Text(
          'Descrição',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: ReadMoreText(
            ad.description,
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Ver mais',
            trimExpandedText: '  ..menos',
            moreStyle: const TextStyle(
              color: Colors.purple,
            ),
            lessStyle: const TextStyle(
              color: Colors.purple,
            ),
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}