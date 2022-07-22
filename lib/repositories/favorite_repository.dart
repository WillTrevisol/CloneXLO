import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../models/ad.dart';
import '../models/user.dart';
import 'parse_errors.dart';
import 'table_keys.dart';

class FavoriteRepository {

  Future<void> save(Ad ad, User user) async {

    final favoriteObject = ParseObject(keyFavoritesTable);

    favoriteObject.set<String>(keyFavoriteOwner, user.id!);
    favoriteObject.set<ParseObject>(keyFavoriteAd, 
      ParseObject(keyAdTable)..set(keyAdId, ad.id),
    );

    final response = await favoriteObject.save();

    if (!response.success) {
      return Future.error('${ParseErrors.getDescription(response.error?.code ?? -1)}');
    }
  }

  Future<void> delete(Ad ad, User user) async {

    try {
      final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyFavoritesTable));

      queryBuilder.whereEqualTo(keyFavoriteOwner, user.id);
      queryBuilder.whereEqualTo(
        keyFavoriteAd, 
        ParseObject(keyAdTable)..set(keyAdId, ad.id)
      );

      final response = await queryBuilder.query();

      if (response.success && response.results != null) {
        for (final favorite in response.results! as List<ParseObject>) {
          await favorite.delete();
        }
      }
    } catch (e) {
      return Future.error('Falha ao remover favorito.');
    }
  }

  Future<List<Ad>> getFavorites(User user) async {

    final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyFavoritesTable));

    queryBuilder.whereEqualTo(keyFavoriteOwner, user.id);
    queryBuilder.includeObject([keyFavoriteAd, 'ad.owner']);

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return response.results!.map((ad) => Ad.fromParse(ad.get(keyFavoriteAd))).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error('${ParseErrors.getDescription(response.error?.code ?? -1)}');
    }
  }
 
}