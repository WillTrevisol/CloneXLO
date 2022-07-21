import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_xlo_flutter/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../../models/ad.dart';
import '../../ad/ad_screen.dart';
import '../../create_ad.dart/create_ad_screen.dart';

class ActiveTile extends StatelessWidget {
  const ActiveTile({required this.ad, Key? key}) : super(key: key);

  final Ad ad;

  static List<MenuChoice> choices = [
    const MenuChoice(index: 0, title: 'Editar', iconData: Icons.edit_rounded),
    const MenuChoice(index: 1, title: 'Já vendi', iconData: Icons.thumb_up_rounded),
    const MenuChoice(index: 2, title: 'Excluir', iconData: Icons.delete_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => AdScreen(ad: ad)),
        );
      },
      child: Card(
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
                    Text(
                      '${ad.views ?? 0} visitas',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuButton<MenuChoice>(
                onSelected: (choice) {
                  switch(choice.index) {
                    case 0:
                      _editAd(context);
                      break;
                    case 1:
                      break;
                    case 2:
                      break;
                  }
                },
                itemBuilder: (_) {
                  return choices.map(
                    (choice) => PopupMenuItem<MenuChoice>(
                      value: choice,
                      child: Row(
                        children: <Widget> [
                          Icon(
                            choice.iconData,
                            size: 20,
                            color: Colors.purple,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            choice.title,
                            style: const TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).toList();
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _editAd(BuildContext context) async {

    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CreateAdScreen(ad: ad))
    );
  }
}

class MenuChoice {

  const MenuChoice({required this.index, required this.title, required this.iconData});

  final int index;
  final String title;
  final IconData iconData;


}