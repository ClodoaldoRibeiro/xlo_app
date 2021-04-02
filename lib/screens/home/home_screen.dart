import 'package:flutter/material.dart';
import 'package:xlo_app/screens/themes/app_colors.dart';
import 'package:xlo_app/screens/widgets/xlo_appbar.dart';
import 'package:xlo_app/screens/widgets/xlo_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.COR_SECUNDARIA,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 56),
          child: XLOAppBar(),
        ),
        drawer: XLODrawer(),
      ),
    );
  }
}
