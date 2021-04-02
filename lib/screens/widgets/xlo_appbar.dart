import 'package:flutter/material.dart';
import 'package:xlo_app/screens/home/components/search_dialog.dart';

class XLOAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {
              openDialog(context);
            },
            icon: Icon(
              Icons.search,
            )),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border_outlined),
        ),
      ],
    );
  }

  Future<void> openDialog(BuildContext context) async {
    final search = await showDialog(
      context: context,
      builder: (context) {
        return SearchDialog(currentSearch: "Clodoaldo Ribeiro",);
      },
    );

    print(search);
  }
}
