import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/models/ad.dart';
import 'package:xlo_app/screens/ad/components/bottom_bar.dart';
import 'package:xlo_app/screens/ad/components/description_panel.dart';
import 'package:xlo_app/screens/ad/components/location_panel.dart';
import 'package:xlo_app/screens/ad/components/main_panel.dart';
import 'package:xlo_app/screens/ad/components/user_panel.dart';
import 'package:xlo_app/stores/favorite_store.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

class AdScreen extends StatelessWidget {
  AdScreen(this.ad);

  final Ad ad;
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();
  final FavoriteStore favoriteStore = GetIt.I<FavoriteStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anúncio"),
        elevation: 0,
        centerTitle: true,
        actions: [
          if (ad.status == AdStatus.ACTIVE && userManagerStore.isLoggedIn)
            Observer(builder: (_) {
              return IconButton(
                icon: Icon(
                  favoriteStore.favoriteList.any((a) => a.id == ad.id)
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
                onPressed: () {
                  favoriteStore.toggleFavorite(ad);
                },
              );
            }),
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                // padding: const EdgeInsets.symmetric(vertical: 2.5),
                height: 280,
                color: Colors.grey[500],
                child: Carousel(
                  images: ad.images
                      .map(
                        (url) => CachedNetworkImageProvider(url),
                      )
                      .toList(),
                  dotSize: 4,
                  dotBgColor: Colors.transparent,
                  dotColor: Colors.orange,
                  autoplay: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MainPanel(ad),
                    Divider(color: Colors.grey[500]),
                    DescriptionPanel(ad),
                    Divider(color: Colors.grey[500]),
                    LocationPanel(ad),
                    Divider(color: Colors.grey[500]),
                    UserPanel(ad),
                    SizedBox(
                      height: ad.status == AdStatus.PENDING ? 16 : 120,
                    ),
                  ],
                ),
              ),
            ],
          ),
          BottomBar(ad),
        ],
      ),
    );
  }
}
