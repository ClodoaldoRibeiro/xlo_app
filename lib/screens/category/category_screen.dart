import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/models/category.dart';
import 'package:xlo_app/screens/widgets/xlo_error_box.dart';
import 'package:xlo_app/stores/category_store.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({this.showAll = true, this.selected});

  final CategoryStore categoryStore = GetIt.I<CategoryStore>();

  final Category selected;
  final bool showAll;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categorias",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
            margin: const EdgeInsets.fromLTRB(32, 12, 32, 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Observer(
              builder: (_) {
                if (categoryStore.getErro != null) {
                  return XLOErrorBox(
                    message: categoryStore.getErro,
                  );
                } else if (categoryStore.categoriesList.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Container(child: Text("Tem itens"),);
                }
              },
            )),
      ),
    );
  }
}
