import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/screens/home/components/ad_tile.dart';
import 'package:xlo_app/screens/home/components/top_bar.dart';
import 'package:xlo_app/screens/widgets/xlo_appbar.dart';
import 'package:xlo_app/screens/widgets/xlo_drawer.dart';
import 'package:xlo_app/screens/widgets/xlo_empty_card.dart';
import 'package:xlo_app/stores/home_store.dart';

class HomeScreen extends StatelessWidget {
  final HomeStore homeStore = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 56),
          child: XLOAppBar(),
        ),
        drawer: XLODrawer(),
        body: Column(
          children: [
            TopBar(),
            Expanded(child: Observer(
              builder: (context) {
                if (homeStore.error != null)
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.error,
                          color: Colors.white,
                          size: 100,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Ocorreu um erro!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  );

                if (homeStore.loading)
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  );
                if (homeStore.adList.isEmpty)
                  return XLOEmptyCard('Nenhum anúncio encontrado.');

                return ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                  // controller: scrollController,
                  itemCount: homeStore.adList.length,
                  itemBuilder: (_, index) {
                    if (index < homeStore.adList.length)
                      return AdTile(homeStore.adList[index]);
                    //
                    // homeStore.loadNextPage();
                    return Container(
                      height: 10,
                      child: LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.purple),
                      ),
                    );
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
