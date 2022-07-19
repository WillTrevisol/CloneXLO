// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ad_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateAdStore on _CreateAdStoreBase, Store {
  Computed<bool>? _$validImagesComputed;

  @override
  bool get validImages =>
      (_$validImagesComputed ??= Computed<bool>(() => super.validImages,
              name: '_CreateAdStoreBase.validImages'))
          .value;
  Computed<bool>? _$validTitleComputed;

  @override
  bool get validTitle =>
      (_$validTitleComputed ??= Computed<bool>(() => super.validTitle,
              name: '_CreateAdStoreBase.validTitle'))
          .value;
  Computed<bool>? _$validDescriptionComputed;

  @override
  bool get validDescription => (_$validDescriptionComputed ??= Computed<bool>(
          () => super.validDescription,
          name: '_CreateAdStoreBase.validDescription'))
      .value;
  Computed<bool>? _$validCategoryComputed;

  @override
  bool get validCategory =>
      (_$validCategoryComputed ??= Computed<bool>(() => super.validCategory,
              name: '_CreateAdStoreBase.validCategory'))
          .value;
  Computed<Address?>? _$addressComputed;

  @override
  Address? get address =>
      (_$addressComputed ??= Computed<Address?>(() => super.address,
              name: '_CreateAdStoreBase.address'))
          .value;
  Computed<num?>? _$priceComputed;

  @override
  num? get price => (_$priceComputed ??=
          Computed<num?>(() => super.price, name: '_CreateAdStoreBase.price'))
      .value;
  Computed<bool>? _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: '_CreateAdStoreBase.formValid'))
          .value;
  Computed<VoidCallback?>? _$sendPressedComputed;

  @override
  VoidCallback? get sendPressed => (_$sendPressedComputed ??=
          Computed<VoidCallback?>(() => super.sendPressed,
              name: '_CreateAdStoreBase.sendPressed'))
      .value;
  Computed<Color>? _$colorButtonComputed;

  @override
  Color get colorButton =>
      (_$colorButtonComputed ??= Computed<Color>(() => super.colorButton,
              name: '_CreateAdStoreBase.colorButton'))
          .value;

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

  late final _$titleAtom =
      Atom(name: '_CreateAdStoreBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_CreateAdStoreBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$categoryAtom =
      Atom(name: '_CreateAdStoreBase.category', context: context);

  @override
  Category? get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(Category? value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$priceTextAtom =
      Atom(name: '_CreateAdStoreBase.priceText', context: context);

  @override
  String get priceText {
    _$priceTextAtom.reportRead();
    return super.priceText;
  }

  @override
  set priceText(String value) {
    _$priceTextAtom.reportWrite(value, super.priceText, () {
      super.priceText = value;
    });
  }

  late final _$hidePhoneAtom =
      Atom(name: '_CreateAdStoreBase.hidePhone', context: context);

  @override
  bool? get hidePhone {
    _$hidePhoneAtom.reportRead();
    return super.hidePhone;
  }

  @override
  set hidePhone(bool? value) {
    _$hidePhoneAtom.reportWrite(value, super.hidePhone, () {
      super.hidePhone = value;
    });
  }

  late final _$showErrorsAtom =
      Atom(name: '_CreateAdStoreBase.showErrors', context: context);

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_CreateAdStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_CreateAdStoreBase.error', context: context);

  @override
  dynamic get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(dynamic value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$savedAdAtom =
      Atom(name: '_CreateAdStoreBase.savedAd', context: context);

  @override
  bool get savedAd {
    _$savedAdAtom.reportRead();
    return super.savedAd;
  }

  @override
  set savedAd(bool value) {
    _$savedAdAtom.reportWrite(value, super.savedAd, () {
      super.savedAd = value;
    });
  }

  late final _$_CreateAdStoreBaseActionController =
      ActionController(name: '_CreateAdStoreBase', context: context);

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_CreateAdStoreBaseActionController.startAction(
        name: '_CreateAdStoreBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_CreateAdStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_CreateAdStoreBaseActionController.startAction(
        name: '_CreateAdStoreBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_CreateAdStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(Category value) {
    final _$actionInfo = _$_CreateAdStoreBaseActionController.startAction(
        name: '_CreateAdStoreBase.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_CreateAdStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPriceText(String value) {
    final _$actionInfo = _$_CreateAdStoreBaseActionController.startAction(
        name: '_CreateAdStoreBase.setPriceText');
    try {
      return super.setPriceText(value);
    } finally {
      _$_CreateAdStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHidePhone(bool? value) {
    final _$actionInfo = _$_CreateAdStoreBaseActionController.startAction(
        name: '_CreateAdStoreBase.setHidePhone');
    try {
      return super.setHidePhone(value);
    } finally {
      _$_CreateAdStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_CreateAdStoreBaseActionController.startAction(
        name: '_CreateAdStoreBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_CreateAdStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_CreateAdStoreBaseActionController.startAction(
        name: '_CreateAdStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_CreateAdStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(dynamic value) {
    final _$actionInfo = _$_CreateAdStoreBaseActionController.startAction(
        name: '_CreateAdStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_CreateAdStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSavedAd(bool value) {
    final _$actionInfo = _$_CreateAdStoreBaseActionController.startAction(
        name: '_CreateAdStoreBase.setSavedAd');
    try {
      return super.setSavedAd(value);
    } finally {
      _$_CreateAdStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
images: ${images},
title: ${title},
description: ${description},
category: ${category},
priceText: ${priceText},
hidePhone: ${hidePhone},
showErrors: ${showErrors},
loading: ${loading},
error: ${error},
savedAd: ${savedAd},
validImages: ${validImages},
validTitle: ${validTitle},
validDescription: ${validDescription},
validCategory: ${validCategory},
address: ${address},
price: ${price},
formValid: ${formValid},
sendPressed: ${sendPressed},
colorButton: ${colorButton}
    ''';
  }
}
