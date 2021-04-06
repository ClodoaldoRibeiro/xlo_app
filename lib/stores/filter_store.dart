import 'package:mobx/mobx.dart';

part 'filter_store.g.dart';

enum OrderBy { DATE, PRICE }

class FilterStore = _FilterStore with _$FilterStore;

abstract class _FilterStore with Store {
  @observable
  OrderBy orderBy = OrderBy.PRICE;

  @action
  void setOrderBy(OrderBy valeu) {
    this.orderBy = valeu;
  }

  @observable
  int minPrice = 200;

  @action
  void setMinPrice(int valeu) {
    minPrice = valeu;
    print(valeu);
  }

  @observable
  int maxPrice = 300;

  @action
  void setMaxPrice(int valeu) {
    maxPrice = valeu;
    print(maxPrice);
  }

  @computed
  String get priceError =>
      maxPrice != null && minPrice != null && maxPrice < minPrice
          ? 'Faixa de preço inválida'
          : null;
}
