import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_app/screens/category/category_screen.dart';
import 'package:xlo_app/stores/inserir_anucio_store.dart';

class CategoryField extends StatelessWidget {
  InserirAnucioStore anucioStore;

  CategoryField({@required this.anucioStore});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: [
            ListTile(
              title: anucioStore.category == null
                  ? Text(
                      'Categoria',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    )
                  : Text(
                      'Categoria',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
              subtitle: anucioStore.category == null
                  ? null
                  : Text(
                      '${anucioStore.category.description}',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: () async {
                final category = await showDialog(
                  context: context,
                  builder: (_) => CategoryScreen(
                    showAll: false,
                    selected: anucioStore.category,
                  ),
                );
                if (category != null) {
                  anucioStore.setCategory(category);
                }
              },
            ),
            if (anucioStore.categoryError != null)
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.red)),
                ),
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                child: Text(
                  anucioStore.categoryError,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              )
            else
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey[500]),
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
