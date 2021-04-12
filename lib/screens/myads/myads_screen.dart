import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_app/screens/myads/components/active_tile.dart';
import 'package:xlo_app/screens/myads/components/pending_tile.dart';
import 'package:xlo_app/screens/myads/components/sold_tile.dart';
import 'package:xlo_app/screens/widgets/xlo_empty_card.dart';
import 'package:xlo_app/stores/myads_store.dart';

class MyAdsScreen extends StatefulWidget {
  @override
  _MyAdsScreenState createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen>
    with SingleTickerProviderStateMixin {
  final MyAdsStore store = MyAdsStore();

  TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus anúncios"),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.orange,
          tabs: [
            Tab(child: Text('ATIVOS')),
            Tab(child: Text('PENDENTES')),
            Tab(child: Text('VENDIDOS')),
          ],
        ),
      ),
      body: Observer(
        builder: (context) {
          if (store.loading)
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            );

          return TabBarView(
            controller: tabController,
            children: [
              Observer(builder: (_) {
                if (store.activeAds.isEmpty)
                  return XLOEmptyCard('Você não possui nenhum anúncio ativo.');

                return ListView.builder(
                  itemCount: store.activeAds.length,
                  itemBuilder: (_, index) {
                    return ActiveTile(store.activeAds[index], store);
                  },
                );
              }),
              Observer(builder: (_) {
                if (store.pendingAds.isEmpty)
                  return XLOEmptyCard(
                      'Você não possui nenhum anúncio pendente.');

                return ListView.builder(
                  itemCount: store.pendingAds.length,
                  itemBuilder: (_, index) {
                    return PendingTile(store.pendingAds[index]);
                  },
                );
              }),
              Observer(builder: (_) {
                if (store.soldAds.isEmpty)
                  return XLOEmptyCard(
                      'Você não possui nenhum anúncio vendido.');

                return ListView.builder(
                  itemCount: store.soldAds.length,
                  itemBuilder: (_, index) {
                    return SoldTile(store.soldAds[index], store);
                  },
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
