import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/screens/base/base_screen.dart';
import 'package:xlo_app/screens/themes/app_colors.dart';
import 'package:xlo_app/stores/page_store.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

import 'application_parse.dart';

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManagerStore());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApplicationParse.initializeParse();
  setupLocators();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: BaseScreen(),
    );
  }
}
