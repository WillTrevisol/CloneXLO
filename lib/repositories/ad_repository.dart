import 'dart:io';

import 'package:clone_xlo_flutter/models/user.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:path/path.dart' as path;

import '../models/ad.dart';
import '../models/category.dart';
import '../stores/filter_store.dart';
import 'parse_errors.dart';
import 'table_keys.dart';

class AdRepository {

  Future<List<Ad>> getHomeAdList({
    required FilterStore filter, 
    String? search, 
    Category? category,
    required int page,
    }) async {

      final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyAdTable));

      queryBuilder.includeObject([keyAdOwner, keyAdCategory]);

      queryBuilder.whereEqualTo(keyAdStatus, AdStatus.active.index);

      queryBuilder.setAmountToSkip(page * 10);
      queryBuilder.setLimit(10);

      if (search!.isNotEmpty && search.trim().isNotEmpty) {
        queryBuilder.whereContains(keyAdTitle, search, caseSensitive: false);
      }
      
      if (category != null && category.id != '1') {
        queryBuilder.whereEqualTo(
          keyAdCategory, 
          (ParseObject(keyCategoryTable)..set(keyCategoryId, category.id)).toPointer()
        );
      }

      switch(filter.orderBy) {
        
        case OrderBy.price:
          queryBuilder.orderByAscending(keyAdPrice);
          break;
        case OrderBy.date:
        default:
          queryBuilder.orderByDescending(keyAdCreatedAt);
          break;
      }

      if (filter.minPrice != null && filter.minPrice! > 0) {
        queryBuilder.whereGreaterThanOrEqualsTo(keyAdPrice, filter.minPrice);
      }

      if (filter.maxPrice != null && filter.maxPrice! > 0) {
        queryBuilder.whereLessThanOrEqualTo(keyAdPrice, filter.maxPrice);
      }

      if (filter.sellerType > 0 && filter.sellerType < (sellerTypeProfessional | sellerTypeParticular)) {
        final userQuery = QueryBuilder<ParseUser>(ParseUser.forQuery());

        if (filter.sellerType == sellerTypeParticular) {
          userQuery.whereEqualTo(keyUserType, UserType.particular.index);
        }

        if (filter.sellerType == sellerTypeProfessional) {
          userQuery.whereEqualTo(keyUserType, UserType.professional.index);
        }

        queryBuilder.whereMatchesQuery(keyAdOwner, userQuery);
      }

      final response = await queryBuilder.query();

      if (response.success && response.results != null) {
        return response.results!.map((ad) => Ad.fromParse(ad)).toList();
      } else if (response.success && response.results == null) {
        return [];
      } else {
        return Future.error('${ParseErrors.getDescription(response.error?.code ?? -1)}');
      }
  }


  Future<void> save(Ad ad) async {
    try {
      final parseImages = await saveImages(ad.images);

      final parseUser = ParseUser(null, null, null)..set(keyUserId, ad.user!.id);

      final adObject = ParseObject(keyAdTable);

      if (ad.id != null) adObject.objectId = ad.id;

      final parseAcl = ParseACL(owner: parseUser);
      parseAcl.setPublicReadAccess(allowed: true);
      parseAcl.setPublicWriteAccess(allowed: false);
      adObject.setACL(parseAcl);

      adObject.set<String>(keyAdTitle, ad.title);
      adObject.set<String>(keyAdDescription, ad.description);
      adObject.set<bool>(keyAdHidePhone, ad.hidePhone ?? false);
      adObject.set<num>(keyAdPrice, ad.price ?? 0);
      adObject.set<int>(keyAdStatus, ad.adStatus?.index ?? 0);

      adObject.set<String>(keyAdDistrict, ad.address?.district ?? 'Na');
      adObject.set<String>(keyAdCity, ad.address!.city!.name);
      adObject.set<String>(keyAdUf, ad.address!.uf!.initials);
      adObject.set<String>(keyAdZipCode, ad.address!.zipCode!);

      adObject.set<List<ParseFile>>(keyAdImages, parseImages);

      adObject.set<ParseUser>(keyAdOwner, parseUser);

      adObject.set<ParseObject>(keyAdCategory,
          ParseObject(keyCategoryTable)..set(keyCategoryId, ad.category!.id));

      final response = await adObject.save();

      if (!response.success) {
        return Future.error('${ParseErrors.getDescription(response.error?.code ?? -1)}');
      }
    } catch (e) {
      return Future.error('Falha ao salvar anúncio.');
    }
  }

  Future<List<ParseFile>> saveImages(List images) async {
    final parseImages = <ParseFile>[];

    try {
      for (final image in images) {
        if (image is String) {

          final parseFile = ParseFile(File(image), name: path.basename(image));
          final response = await parseFile.save();

          if (!response.success) {
            return Future.error('${ParseErrors.getDescription(response.error!.code)}');
          }

          parseImages.add(parseFile);

          return parseImages;

        } else {

        final parseFile = ParseFile(null);
        parseFile.name = path.basename(image);
        parseFile.url = image;

        parseImages.add(parseFile);

        }
      } 

      return parseImages;
    } catch (e) {
      return Future.error('Falha ao salvar images.');
    } 
  }
}