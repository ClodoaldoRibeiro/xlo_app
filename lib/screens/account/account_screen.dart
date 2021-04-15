import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/screens/edit_account/edit_account_screen.dart';
import 'package:xlo_app/screens/favorites/favorites_screen.dart';
import 'package:xlo_app/screens/myads/myads_screen.dart';
import 'package:xlo_app/screens/themes/app_colors.dart';
import 'package:xlo_app/screens/widgets/xlo_drawer.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heightHeader = size.height * 0.25;

    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Conta"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => EditAccountScreen(),
                  ),
                );
              })
        ],
      ),
      drawer: XLODrawer(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            height: heightHeader,
            color: AppColors.COR_PRIMARIA,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Icon(
                    Icons.account_circle,
                    size: heightHeader * 0.45,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Observer(builder: (_) {
                    return Text(
                      GetIt.I<UserManagerStore>().userModel.nome,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    );
                  }),
                  Text(
                    GetIt.I<UserManagerStore>().userModel.email,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Meus anúncios',
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => MyAdsScreen()));
                  },
                ),
                ListTile(
                  title: Text(
                    'Favoritos',
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => FavoritesScreen(hideDrawer: true)));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
