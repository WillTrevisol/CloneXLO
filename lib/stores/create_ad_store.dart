import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/ad.dart';
import '../models/address.dart';
import '../models/category.dart';
import '../repositories/ad_repository.dart';
import 'user_manager_store.dart';
import 'zipcode_store.dart';
part 'create_ad_store.g.dart';

// ignore: library_private_types_in_public_api
class CreateAdStore = _CreateAdStoreBase with _$CreateAdStore;

abstract class _CreateAdStoreBase with Store {

  @observable
  ObservableList images = ObservableList();

  @computed
  bool get validImages => images.isNotEmpty;
  String? get imagesError {
    if (!showErrors || validImages) {
      return null;
    }

    return 'Insira ao menos uma imagem.';
  }

  @observable
  String title = '';

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get validTitle => title.length >= 5;
  String? get titleError {
    if (!showErrors || validTitle) {
      return null;
    }

    if (!showErrors || title.isEmpty) {
      return 'Campo obrigatório!';
    }

    return 'Título muito curto.';
  }

  @observable
  String description = '';

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get validDescription => description.length >= 10;
  String? get descriptionError {
    if (!showErrors || validDescription) {
      return null;
    }

    if (!showErrors || description.isEmpty) {
      return 'Campo obrigatório!';
    }

    return 'Descrição muito curta.';
  }

  @observable
  Category? category;

  @action
  void setCategory(Category value) => category = value;

  @computed
  bool get validCategory => category != null;
  String? get categoryError {
    if (!showErrors || validCategory) {
      return null;
    }

    return 'Selecione uma categoria.';
  }

  late ZipCodeStore zipCodeController = ZipCodeStore();

  @computed
  Address? get address => zipCodeController.address;
  bool get validAddress => address != null;
  String? get addressError {
    if (!showErrors || validAddress) {
      return null;
    }

    return 'Campo obrigatório.';
  }

  @observable
  String priceText = '';

  @action
  void setPriceText(String value) => priceText = value;

  @computed
  double? get price {
    if (priceText.contains(',')) {
      return double.tryParse(
        priceText.replaceAll(
          RegExp('[^0-9]'), '')) !/ 100;
    }

    return double.tryParse(priceText); 
  }
  bool get validPrice => price != null && price !< 9999999;
  String? get priceError {
    if (!showErrors || validPrice) {
      return null;
    }

    if (priceText.isEmpty) {
      return 'Campo obrigatório.';
    }

    return 'Preço inválido';
  }

  @observable
  bool? hidePhone = false;

  @action
  void setHidePhone(bool? value) => hidePhone = value;

  @computed
  bool get formValid => validImages && validTitle && validDescription && validCategory && validAddress && validPrice;

  @computed
  VoidCallback? get sendPressed => formValid ? _send : null;

  @computed
  Color get colorButton => formValid ? Colors.orange : Colors.orange.withAlpha(100);

  @observable
  bool showErrors = false;

  @action
  void invalidSendPressed() => showErrors = true;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  dynamic error;

  @action
  void setError(dynamic value) => error = value;

  @observable
  Ad? savedAd;

  @action
  void setSavedAd(Ad value) => savedAd = value;

  Future<void> _send() async {
    setError(null);

    final ad = Ad(
      images: images, 
      title: title, 
      description: description, 
      category: category, 
      address: address, 
      price: price, 
      hidePhone: hidePhone, 
      user: GetIt.I.get<UserManagerStore>().user,
    );

    setLoading(true);
    try {
      final savedAd = await AdRepository().save(ad);
      setSavedAd(savedAd!);
    } catch (e) {
      setError(e);
    }
    setLoading(false);
  }

}