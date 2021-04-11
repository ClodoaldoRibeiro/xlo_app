import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/models/ad.dart';
import 'package:xlo_app/repositories/ad_repository.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

part 'myads_store.g.dart';

class MyAdsStore = _MyAdsStore with _$MyAdsStore;

abstract class _MyAdsStore with Store {
  _MyAdsStore() {
    _getMyAds();
  }

  @observable
  List<Ad> allAds = [];

  @computed
  List<Ad> get activeAds =>
      allAds.where((ad) => ad.status == AdStatus.ACTIVE).toList();
  List<Ad> get pendingAds =>
      allAds.where((ad) => ad.status == AdStatus.PENDING).toList();
  List<Ad> get soldAds =>
      allAds.where((ad) => ad.status == AdStatus.SOLD).toList();

  Future<void> _getMyAds() async {
    final user = GetIt.I<UserManagerStore>().userModel;

    try {
      // loading = true;
      allAds = await AdRepository().getMyAds(user);
      print(allAds);
      //loading = false;
    } catch (e) {}
  }

  @observable
  bool loading = false;

  void refresh() => _getMyAds();
  //
  // @action
  // Future<void> soldAd(Ad ad) async {
  //   loading = true;
  //   await AdRepository().sold(ad);
  //   refresh();
  // }
  //
  // @action
  // Future<void> deleteAd(Ad ad) async {
  //   loading = true;
  //   await AdRepository().delete(ad);
  //   refresh();
  // }
}
