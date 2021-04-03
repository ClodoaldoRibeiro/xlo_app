import 'package:flutter/material.dart';
import 'package:xlo_app/screens/home/components/bar_button.dart';
import 'package:xlo_app/screens/themes/app_colors.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BarButton(
          label: "Categorias",
          decoracao: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey[400]),
            ),
          ),
          onTap: () {},
        ),
        BarButton(
          label: "Filtros",
          decoracao: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey[400]),
              left: BorderSide(color: Colors.grey[400]),
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
