import 'package:mobx/mobx.dart';
import 'package:xlo_app/models/category.dart';
import 'package:xlo_app/repositories/ad_repository.dart';
import 'package:xlo_app/stores/filter_store.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {

  _HomeStore() {
    autorun((_) async {
      try {
        final newAds = await AdRepository().getHomeAdList(
          filter: filter,
          search: search,
          category: category,
        );
      } catch (e) {
      }
    });
  }


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

  @observable
  FilterStore filter = FilterStore();

  FilterStore get clonedFilter => filter.clone();

  @action
  void setFilter(valeu) {
    this.filter = valeu;
  }
}
