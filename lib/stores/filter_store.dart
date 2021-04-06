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
}
