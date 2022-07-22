import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_xlo_flutter/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../models/ad.dart';
import '../../../stores/favorite_store.dart';
import '../../ad/ad_screen.dart';

class FavoriteTile extends StatelessWidget {
  FavoriteTile({required this.ad, Key? key}) : super(key: key);

  final Ad ad;
  final FavoriteStore favoriteController = GetIt.I.get<FavoriteStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => AdScreen(ad: ad))
        );
      },
      child: Container(
        height: 135,
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Row(
            children: <Widget> [
              Expanded(
                flex: 35,
                child: SizedBox(
                  height: 135,
                  width: 127,
                  child: ad.images.isEmpty ? Image.asset('assets/images/no-image.jpeg') : CachedNetworkImage(
                    imageUrl: ad.images.first,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 65,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [
                      Text(
                        ad.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        ad.price!.formatedMoney(),
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: <Widget> [
                          Expanded(
                            child: Text(
                              '${ad.createdAt!.formatedDate()} - '
                                '${ad.address?.city?.name} - '
                                  '${ad.address?.uf?.initials}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: GestureDetector(
                              onTap: () => favoriteController.toggleFavorite(ad),
                              child: const Icon(
                                Icons.delete,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}