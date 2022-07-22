import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_xlo_flutter/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../../models/ad.dart';
import '../../ad/ad_screen.dart';

class PendingTile extends StatelessWidget {
  const PendingTile({required this.ad, Key? key}) : super(key: key);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => AdScreen(ad: ad)),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const <Widget> [
                        Icon(
                          Icons.access_time_rounded,
                          color: Colors.orange,
                          size: 15,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'AGUARDANDO PUBLICAÇÃO',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}