import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/screens/login/login_screen.dart';
import 'package:xlo_app/screens/themes/app_colors.dart';
import 'package:xlo_app/stores/page_store.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

class XLODrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return SizedBox(
      width: _size.width * 0.70,
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(60)),
        child: Drawer(
          child: ListView(
            children: [
              _XLODrawerHeader(),
              _XLODrawerSection(),
            ],
          ),
        ),
      ),
    );
  }
}

/*
* Menu da Aplicicação.
* */
class _XLODrawerSection extends StatelessWidget {
  /* Pega a instância unica de PageStore*/
  PageStore _pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _XLODrawerTile(
          title: 'Anúncios',
          iconData: Icons.list,
          onTap: () {
            _pageStore.setPage(0);
          },
          highLighted: _pageStore.page == 0,
        ),
        _XLODrawerTile(
            title: 'Inserir Anúncio',
            iconData: Icons.edit,
            onTap: () {
              _pageStore.setPage(1);
            },
            highLighted: _pageStore.page == 1),
        _XLODrawerTile(
          title: 'Chat',
          iconData: Icons.chat,
          onTap: () {
            _pageStore.setPage(2);
          },
          highLighted: _pageStore.page == 2,
        ),
        _XLODrawerTile(
          title: 'Favoritos',
          iconData: Icons.favorite,
          onTap: () {
            _pageStore.setPage(3);
          },
          highLighted: _pageStore.page == 3,
        ),
        _XLODrawerTile(
          title: 'Minha Conta',
          iconData: Icons.person,
          onTap: () {
            _pageStore.setPage(4);
          },
          highLighted: _pageStore.page == 4,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text(
            "Sair",
            style:
                TextStyle(fontWeight: FontWeight.w700, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}

/*
* Componente que monta um item do menu da aplicação, caso ele esteja selecionado
* então ele ficará com a cor primária da aplicação
* */
class _XLODrawerTile extends StatelessWidget {
  _XLODrawerTile(
      {@required this.title,
      @required this.iconData,
      @required this.onTap,
      @required this.highLighted});

  final String title;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highLighted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            color: highLighted ? AppColors.COR_PRIMARIA : Colors.black54),
      ),
      leading: Icon(
        iconData,
        color: highLighted ? AppColors.COR_PRIMARIA : Colors.black54,
      ),
      onTap: onTap,
    );
  }
}

class _XLODrawerHeader extends StatelessWidget {
  final UserManagerStore _userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    double heightHeader = _size.height * 0.20;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();

        if (_userManagerStore.isLoggedIn) {
          GetIt.I<PageStore>().setPage(4);
        } else {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => LoginScreen()));
        }
      },
      child: Container(
        color: AppColors.COR_PRIMARIA,
        height: heightHeader,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          //Alinhamento da Coluna
          crossAxisAlignment: CrossAxisAlignment.center,
          // Alinhamento da Horizontal
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.account_circle,
              size: heightHeader * 0.50,
              color: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                //Alinhamento da Coluna
                crossAxisAlignment: CrossAxisAlignment.start,
                // Alinhamento da Horizontal
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      _userManagerStore.isLoggedIn
                          ? _userManagerStore.userModel.nome
                          : "Acesse sua conta agora",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(
                    height: heightHeader * 0.08,
                  ),
                  Text(
                      _userManagerStore.isLoggedIn
                          ? _userManagerStore.userModel.email
                          : 'Clique aqui',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
