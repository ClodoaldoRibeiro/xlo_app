import 'package:mobx/mobx.dart';
import 'package:xlo_app/models/category.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  String search = "";

  @action
  void setSearch(valeu) {
    this.search = valeu;
  }

  @observable
  Category category;

  @action
  void setCategory(valeu) {
    this.category = valeu;
  }
}
