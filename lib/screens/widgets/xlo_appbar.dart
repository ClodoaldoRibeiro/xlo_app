import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/screens/home/components/search_dialog.dart';
import 'package:xlo_app/stores/home_store.dart';
import 'package:xlo_app/stores/page_store.dart';

class XLOAppBar extends StatelessWidget {
  final HomeStore homeStore = GetIt.I<HomeStore>();
  final PageStore _pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Observer(
        builder: (context) {
          if (homeStore.search.isNotEmpty) {
            return GestureDetector(
                onTap: () {
                  openDialog(context);
                },
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      width: constraints.biggest.width,
                      child: Text(
                        homeStore.search,
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    );
                  },
                ));
          } else {
            return Text("Super XLO");
          }
        },
      ),
      actions: [
        Observer(
          builder: (context) {
            if (homeStore.search.isEmpty) {
              return IconButton(
                  onPressed: () {
                    openDialog(context);
                  },
                  icon: Icon(
                    Icons.search,
                  ));
            } else {
              return IconButton(
                  onPressed: () {
                    homeStore.setSearch("");
                  },
                  icon: Icon(
                    Icons.close,
                  ));
            }
          },
        ),
        IconButton(
          onPressed: () {
            _pageStore.setPage(3);
          },
          icon: Icon(Icons.favorite_border_outlined),
        ),
      ],
    );
  }

  Future<void> openDialog(BuildContext context) async {
    final String search = await showDialog(
      context: context,
      builder: (context) {
        return SearchDialog(
          currentSearch: homeStore.search,
        );
      },
    );

    if (search != null) {
      homeStore.setSearch(search);
    }
    print(search);
  }
}
