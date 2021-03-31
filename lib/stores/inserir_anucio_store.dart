import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/models/ad.dart';
import 'package:xlo_app/models/address.dart';
import 'package:xlo_app/models/category.dart';
import 'package:xlo_app/repositories/ad_repository.dart';
import 'package:xlo_app/stores/cep_store.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

part 'inserir_anucio_store.g.dart';

class InserirAnucioStore = _InserirAnucioStore with _$InserirAnucioStore;

abstract class _InserirAnucioStore with Store {
  ObservableList _imgens = ObservableList();

  @observable
  Category category;

  @observable
  bool hidePhone = false;

  @observable
  String title = "";

  @observable
  String description = "";

  @action
  void setHidePhone(bool valeu) {
    hidePhone = valeu;
  }

  void setImage(File file) {
    if (file != null) _imgens.add(file);
  }

  void removeImage(index) {
    _imgens.removeAt(index);
  }

  @action
  File getImage(index) {
    return _imgens[index];
  }

  @computed
  int get imagesLength => _imgens.length;

  @computed
  bool get imageValid => _imgens.isNotEmpty;

  String get imageError {
    if (!showErrors || imageValid) {
      return null;
    } else {
      return "Inserir imagem";
    }
  }

  @computed
  bool get titleValid => title.length > 6;

  String get titleError {
    if (!showErrors || titleValid) {
      return null;
    } else if (title.isEmpty) {
      return "Inserir título";
    } else {
      return "Título muito curto";
    }
  }

  @action
  void setTitle(String valeu) {
    title = valeu;
  }

  @computed
  bool get descriptionValid => description.length > 10;

  String get descriptionError {
    if (!showErrors || descriptionValid) {
      return null;
    } else if (title.isEmpty) {
      return "Informe a descrição";
    } else {
      return "Descrição muito curta";
    }
  }

  @action
  void setDescription(String valeu) {
    description = valeu;
  }

  @computed
  bool get categoryValid => category != null;

  @action
  void setCategory(Category value) {
    this.category = value;
  }

  String get categoryError {
    if (!showErrors || categoryValid) {
      return null;
    } else {
      return "Inserir categoria";
    }
  }

  @observable
  CepStore cepStore = CepStore();

  @computed
  Address get address => cepStore.address;

  @computed
  bool get addressValid => cepStore.address != null;

  String get addressError {
    if (!showErrors || addressValid) {
      return null;
    } else {
      return "Campo obrigatóorio";
    }
  }

  @observable
  String priceText = '';

  @action
  void setPrice(String value) => priceText = value;

  @computed
  num get price {
    if (priceText.contains(',')) {
      return num.tryParse(priceText.replaceAll(RegExp('[^0-9]'), '')) / 100;
    } else {
      return num.tryParse(priceText);
    }
  }

  bool get priceValid => price != null && price <= 9999999;

  String get priceError {
    if (!showErrors || priceValid)
      return null;
    else if (priceText.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Preço inválido';
  }

  @computed
  bool get formValid =>
      imageValid &&
      titleValid &&
      descriptionValid &&
      categoryValid &&
      addressValid &&
      priceValid;

  @computed
  Function get sendPressed => formValid ? _send : null;

  @observable
  bool showErrors = false;

  @action
  void invalidSendPressed() => showErrors = true;

  @observable
  bool loading = false;

  @observable
  String error;

  @observable
  bool savedAd = false;

  @action
  Future<void> _send() async {
    final Ad ad = Ad();

    ad.title = title;
    ad.description = description;
    ad.category = category;
    ad.price = price;
    ad.hidePhone = hidePhone;
    ad.images = _imgens;
    ad.address = address;
    ad.user = GetIt.I<UserManagerStore>().userModel;

    loading = true;
    try {
      await AdRepository().save(ad);
      savedAd = true;
    } catch (e) {
      error = e;
    }
    loading = false;
  }
}
