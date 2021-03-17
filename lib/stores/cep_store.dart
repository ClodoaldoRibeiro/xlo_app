import 'package:mobx/mobx.dart';
import 'package:xlo_app/models/address.dart';
import 'package:xlo_app/repositories/cep_repository.dart';

part 'cep_store.g.dart';

class CepStore = _CepStore with _$CepStore;

abstract class _CepStore with Store {
  _CepStore() {
    autorun((_) {
      if (cep.length != 8) {
        _reset();
      } else {
        _searchCep();
      }
    });
  }
  @observable
  String cep;

  @action
  void setCep(String valeu) {
    cep = valeu;
  }

  @computed
  String get cleanCep {
    return cep.replaceAll(RegExp('[^0-9]'), "");
  }

  @observable
  Address address;

  @observable
  String error;

  @observable
  bool loading = false;

  @action
  Future<void> _searchCep() async {
    loading = true;

    try {
      address = await CepRepository().getAddressFromApi(cleanCep);
      error = null;
    } catch (e) {
      error = e;
      address = null;
    }

    loading = false;
  }

  void _reset() {
    error = null;
    address = null;
  }
}
