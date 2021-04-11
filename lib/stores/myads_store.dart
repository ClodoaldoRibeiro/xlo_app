import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/repositories/ad_repository.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

part 'myads_store.g.dart';

class MyAdsStore = _MyAdsStore with _$MyAdsStore;

abstract class _MyAdsStore with Store {
  _MyAdsStore() {
    _getMyAds();
  }

  Future<void> _getMyAds() async {
    final user = GetIt.I<UserManagerStore>().userModel;

    try {
      // loading = true;
      final allAds = await AdRepository().getMyAds(user);
      print(allAds);
      //loading = false;
    } catch (e) {}
  }
}
