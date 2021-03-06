import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/screens/base/base_screen.dart';
import 'package:xlo_app/screens/themes/app_colors.dart';
import 'package:xlo_app/stores/category_store.dart';
import 'package:xlo_app/stores/connectivity_store.dart';
import 'package:xlo_app/stores/favorite_store.dart';
import 'package:xlo_app/stores/home_store.dart';
import 'package:xlo_app/stores/page_store.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

import 'application_parse.dart';

void setupLocators() {
  GetIt.I.registerSingleton(ConnectivityStore());
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(HomeStore());
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(CategoryStore());
  GetIt.I.registerSingleton(FavoriteStore());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApplicationParse.initializeParse();
  setupLocators();

  runApp(XLOApp());
}

class XLOApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          cursorColor: AppColors.COR_PRIMARIA,
          primaryColor: AppColors.COR_PRIMARIA,
          scaffoldBackgroundColor: AppColors.COR_PRIMARIA,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(elevation: 0)),
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: BaseScreen(),
    );
  }
}
