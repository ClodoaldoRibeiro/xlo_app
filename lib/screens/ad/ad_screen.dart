import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:xlo_app/models/ad.dart';
import 'package:xlo_app/screens/ad/components/bottom_bar.dart';
import 'package:xlo_app/screens/ad/components/description_panel.dart';
import 'package:xlo_app/screens/ad/components/location_panel.dart';
import 'package:xlo_app/screens/ad/components/main_panel.dart';
import 'package:xlo_app/screens/ad/components/user_panel.dart';

class AdScreen extends StatelessWidget {
  AdScreen(this.ad);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anúncio"),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
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
