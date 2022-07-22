import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_xlo_flutter/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../../models/ad.dart';
import '../../../stores/myads_store.dart';

class SoldTile extends StatelessWidget {
  const SoldTile({required this.controller, required this.ad, Key? key}) : super(key: key);

  final Ad ad;
  final MyAdsStore controller;

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
              onPressed: () {
                _deleteAd(context);
              }, 
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

  void _deleteAd(BuildContext context) {
    showDialog(
      context: context, 
      builder: (_) => AlertDialog(
        title: const Text('Atenção'),
        content: Text('Tem certeza que deseja deletar, ${ad.title}?'),
        actions: <Widget> [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), 
            child: const Text('Cancelar')
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              controller.deleteAd(ad);
            }, 
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}