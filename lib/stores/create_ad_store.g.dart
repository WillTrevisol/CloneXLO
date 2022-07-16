// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ad_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateAdStore on _CreateAdStoreBase, Store {
  late final _$imagesAtom =
      Atom(name: '_CreateAdStoreBase.images', context: context);

  @override
  ObservableList<dynamic> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(ObservableList<dynamic> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  @override
  String toString() {
    return '''
images: ${images}
    ''';
  }
}
