import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/screens/home/home_screen.dart';
import 'package:xlo_app/screens/inseriranucio/inserir_anucio_screen.dart';
import 'package:xlo_app/screens/widgets/xlo_drawer.dart';
import 'package:xlo_app/stores/page_store.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  PageController _pageController = PageController();

  /* Cria uma instância única da PageStore*/
  PageStore _pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    super.initState();

    reaction((_) {
      return _pageStore.page;
    }, (page) {
      return _pageController.jumpToPage(page);
    });
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
          Scaffold(
            appBar: AppBar(
              title: Text("Chat"),
              centerTitle: true,
            ),
            drawer: XLODrawer(),
          ),
          Scaffold(
            appBar: AppBar(title: Text("Favoritos"), centerTitle: true),
            drawer: XLODrawer(),
          ),
          Scaffold(
            appBar: AppBar(title: Text("Minha Conta"), centerTitle: true),
            drawer: XLODrawer(),
          ),
        ],
      ),
    );
  }
}