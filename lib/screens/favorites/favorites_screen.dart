import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/screens/favorites/components/favorite_tile.dart';
import 'package:xlo_app/screens/widgets/xlo_drawer.dart';
import 'package:xlo_app/screens/widgets/xlo_empty_card.dart';
import 'package:xlo_app/stores/favorite_store.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({this.hideDrawer = false});

  final bool hideDrawer;

  final FavoriteStore favoriteStore = GetIt.I<FavoriteStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
        centerTitle: true,
      ),
      drawer: hideDrawer ? null : XLODrawer(),
      body: Observer(builder: (_) {
        if (favoriteStore.favoriteList.isEmpty)
          return XLOEmptyCard('Nenhum anúncio favoritado.');

        return ListView.builder(
          padding: const EdgeInsets.all(2),
          itemCount: favoriteStore.favoriteList.length,
          itemBuilder: (_, index) =>
              FavoriteTile(favoriteStore.favoriteList[index]),
        );
      }),
    );
  }
}
