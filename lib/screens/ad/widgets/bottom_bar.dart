import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/ad.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({required this.ad, Key? key}) : super(key: key);

  final Ad  ad;
  
  @override
  Widget build(BuildContext context) {

    if (ad.adStatus == AdStatus.pending) {
      return Container();
    }

    return Positioned(
      bottom: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 26),
            height: 38,
            width: MediaQuery.of(context).size.width * 0.8,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: Colors.orange
            ),
            child: Row(
              children: <Widget> [
                if (!ad.hidePhone!) Expanded(
                  child: TextButton(
                    onPressed: () async {
                      final number = ad.user!.phone.replaceAll(RegExp('[^0-9]'), '');
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: number,
                      );

                      await launchUrl(launchUri);
                    },
                    child: const Text(
                      'Ligar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                VerticalDivider(
                  indent: 6, 
                  endIndent: 6, 
                  color: Colors.black.withAlpha(120),
                  thickness: 1,
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {  },
                    child: const Text(
                      'Chat',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(249, 249, 249, 1),
              border: Border(
                top: BorderSide(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            height: 38,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text(
              '${ad.user!.name} (anunciante)',
              style: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      )
    );
  }

}