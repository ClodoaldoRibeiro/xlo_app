import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:xlo_app/models/category.dart';

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
  bool get isImageValid => _imgens.isNotEmpty;

  String get imageError {
    if (isImageValid) {
      return null;
    } else {
      return "Inserir imagem";
    }
  }

  @computed
  bool get isTitleValid => title.length > 6;

  String get titleError {
    if (isTitleValid) {
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
  bool get isDescriptionalid => description.length > 10;

  String get descriptionError {
    if (isDescriptionalid) {
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

  @action
  void setCategory(Category value) {
    this.category = value;
  }

  @computed
  bool get categoryValid => category != null;
}
