import 'dart:io';

import 'package:mobx/mobx.dart';

part 'inserir_anucio_store.g.dart';

class InserirAnucioStore = _InserirAnucioStore with _$InserirAnucioStore;

abstract class _InserirAnucioStore with Store {
  ObservableList _imgens = ObservableList();

  void setImage(File file) {
    if (file != null) _imgens.add(file);
  }

  void removeImage(index) {
    _imgens.removeAt(index);
  }

  @computed
  int get imagesLength => _imgens.length;

  @action
  File getImage(index) {
    return _imgens[index];
  }
}
