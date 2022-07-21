import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_xlo_flutter/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../../models/ad.dart';

class SoldTile extends StatelessWidget {
  const SoldTile({required this.ad, Key? key}) : super(key: key);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: SizedBox(
        height: 80,
        child: Row(
          children: <Widget> [
            AspectRatio	(
              aspectRatio: 1,
              child: ad.images.isEmpty ? Image.asset('assets/images/no-image.jpeg') : CachedNetworkImage(
                imageUrl: ad.images.first,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  Text(
                    ad.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    ad.price!.formatedMoney(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {}, 
              icon: const Icon(
                Icons.delete_forever_rounded,
                size: 24,
                color: Colors.red,
              )
            ),
          ],
        ),
      ),
    );
  }
}