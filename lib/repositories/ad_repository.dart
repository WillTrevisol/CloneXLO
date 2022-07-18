import 'dart:io';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:path/path.dart' as path;

import '../models/ad.dart';
import 'parse_errors.dart';
import 'table_keys.dart';

class AdRepository {

  Future<Ad?> save(Ad ad) async {

    try {
      final parseImages = await saveImages(ad.images);
      final parseUser = ParseUser(null, null, null)..set(keyUserId, ad.user?.id);
      final adObject = ParseObject(keyAdTable);
      final parseAcl = ParseACL(owner: parseUser);

      parseAcl.setPublicReadAccess(allowed: true);
      parseAcl.setPublicWriteAccess(allowed: false);
      adObject.setACL(parseAcl);

      adObject.set<String>(keyAdTitle, ad.title);
      adObject.set<String>(keyAdDescription, ad.description);
      adObject.set<bool>(keyAdHidePhone, ad.hidePhone!);
      adObject.set<double>(keyAdPrice, ad.price!);
      adObject.set<int>(keyAdStatus, ad.adStatus.index);

      adObject.set<String>(keyAdDistrict, ad.address!.district!);
      adObject.set<String>(keyAdCity, ad.address!.city!.name);
      adObject.set<String>(keyAdUf, ad.address!.uf!.initials);
      adObject.set<String>(keyAdZipCode, ad.address!.zipCode!);

      adObject.set<List<ParseFile>>(keyAdImages, parseImages);

      adObject.set<ParseUser>(keyAdOwner, parseUser);

      adObject.set<ParseObject>(
        keyAdCategory, 
        ParseObject(keyCategoryTable)..set(keyCategoryId, ad.category!.id),
      );

      final response = await adObject.save();

      if (response.success) {
        return Ad.fromParse(response.result);
      } else {
        return Future.error('${ParseErrors.getDescription(response.error!.code)}');
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