import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/screens/category/category_screen.dart';
import 'package:xlo_app/screens/filter/filter_screen.dart';
import 'package:xlo_app/screens/home/components/bar_button.dart';
import 'package:xlo_app/stores/home_store.dart';

class TopBar extends StatelessWidget {
  final HomeStore homeStore = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Observer(
          builder: (context) {
            return BarButton(
              label: homeStore.category?.description ?? "Categorias",
              decoracao: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[400]),
                ),
              ),
              onTap: () async {
                final categoria =
                    await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return CategoryScreen(
                      showAll: true,
                      selected: homeStore.category,
                    );
                  },
                ));

                if (categoria != null) {
                  homeStore.setCategory(categoria);
                }
                print("categoria: ${categoria}");
              },
            );
          },
        ),
        BarButton(
          label: "Filtros",
          decoracao: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey[400]),
              left: BorderSide(color: Colors.grey[400]),
            ),
          ),
          onTap: () async {
            await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return FilterScreen();
              },
            ));
          },
        ),
      ],
    );
  }
}
