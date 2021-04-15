import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/screens/account/account_screen.dart';
import 'package:xlo_app/screens/chat/chat_screen.dart';
import 'package:xlo_app/screens/favorites/favorites_screen.dart';
import 'package:xlo_app/screens/home/home_screen.dart';
import 'package:xlo_app/screens/inseriranucio/inserir_anucio_screen.dart';
import 'package:xlo_app/screens/offline/offline_screen.dart';
import 'package:xlo_app/stores/connectivity_store.dart';
import 'package:xlo_app/stores/page_store.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  PageController _pageController = PageController();

  /* Cria uma instância única da PageStore*/
  PageStore _pageStore = GetIt.I<PageStore>();
  final ConnectivityStore connectivityStore = GetIt.I<ConnectivityStore>();

  @override
  void initState() {
    super.initState();

    reaction((_) {
      return _pageStore.page;
    }, (page) {
      return _pageController.jumpToPage(page);
    });

    autorun(
      (_) {
        print(connectivityStore.connected);
        if (!connectivityStore.connected) {
          Future.delayed(Duration(milliseconds: 50)).then((value) {
            showDialog(context: context, builder: (_) => OfflineScreen());
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(), // Home do Aplicativo
          InserirAnucioScreen(),
          ChatScreen(),
          FavoritesScreen(
            hideDrawer: false,
          ),
          AccountScreen(),
        ],
      ),
    );
  }
}
