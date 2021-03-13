import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:xlo_app/models/category.dart';

part 'inserir_anucio_store.g.dart';

class InserirAnucioStore = _InserirAnucioStore with _$InserirAnucioStore;

abstract class _InserirAnucioStore with Store {
  ObservableList _imgens = ObservableList();

  @observable
  Category category;


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


  @action
  void setCategory(Category value){
   this.category = value;
  }

  @computed
  bool get categoryValid => category != null;


}
