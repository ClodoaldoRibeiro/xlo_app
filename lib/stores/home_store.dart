import 'package:mobx/mobx.dart';
import 'package:xlo_app/models/ad.dart';
import 'package:xlo_app/repositories/ad_repository.dart';
import 'package:xlo_app/stores/filter_store.dart';
import 'package:xlo_app/models/category.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  _HomeStore() {
    autorun((_) async {
      try {
        setLoading(true);
        final newAds = await AdRepository().getHomeAdList(
            filter: filter, search: search, category: category, page: page);
        addNewAds(newAds);
        print("newAds.length ${newAds.length}");
        setError(null);
        setLoading(false);
      } catch (e) {
        setError(e);
      }
    });
  }

  ObservableList<Ad> adList = ObservableList<Ad>();

  @observable
  String search = "";

  @action
  void setSearch(valeu) {
    this.search = valeu;
    resetPage();
  }

  @observable
  String error = null;

  @action
  void setError(valeu) {
    this.error = valeu;
  }

  @observable
  bool loading;

  @action
  void setLoading(valeu) {
    this.loading = valeu;
  }

  @observable
  Category category;

  @action
  void setCategory(valeu) {
    this.category = valeu;
    resetPage();
  }

  @observable
  FilterStore filter = FilterStore();

  FilterStore get clonedFilter => filter.clone();

  @action
  void setFilter(valeu) {
    this.filter = valeu;
    resetPage();
  }

  @observable
  int page = 0;

  @observable
  bool lastPage = false;

  @action
  void loadNextPage() {
    page++;
  }

  @action
  void resetPage() {
    page = 0;
    adList.clear();
    lastPage = false;
  }

  @computed
  int get itemCount => lastPage ? adList.length : adList.length + 1;

  @action
  void addNewAds(List<Ad> newAds) {
    if (newAds.length < 10) lastPage = true;
    adList.addAll(newAds);
  }


  @computed
  bool get showProgress => loading && adList.isEmpty;
}
