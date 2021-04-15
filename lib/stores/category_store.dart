import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/models/category.dart';
import 'package:xlo_app/repositories/category_repository.dart';

import 'connectivity_store.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {
  ObservableList<Category> categoriesList = ObservableList<Category>();
  final ConnectivityStore connectivityStore = GetIt.I<ConnectivityStore>();

  @observable
  String _erro;

  _CategoryStore() {
    autorun((_) {
      if (connectivityStore.connected && categoriesList.isEmpty)
        _loadCategories();
    });

    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      final categories = await CategoryRepository().getList();
      setCategories(categories);
    } catch (e) {
      setErro(e);
    }
  }

  @computed
  List<Category> get allCategoryList => List.from(categoriesList)
    ..insert(0, Category(id: '*', description: 'Todas'));

  @action
  void setErro(String e) {
    _erro = e;
  }

  @computed
  String get getErro {
    return this._erro;
  }

  @action
  void setCategories(List<Category> categories) {
    categoriesList.clear();
    categoriesList.addAll(categories);
  }
}
