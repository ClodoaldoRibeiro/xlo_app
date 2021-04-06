import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_app/screens/filter/section_title.dart';
import 'package:xlo_app/screens/themes/app_colors.dart';
import 'package:xlo_app/stores/filter_store.dart';

class OrderByField extends StatelessWidget {
  OrderByField({this.filter});

  final FilterStore filter;

  @override
  Widget build(BuildContext context) {
    Widget buildOption(String title, OrderBy opcao) {
      return GestureDetector(
        onTap: () {
          filter.setOrderBy(opcao);
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: filter.orderBy == opcao ? AppColors.COR_PRIMARIA : Colors.transparent,
            border: Border.all(
              color: filter.orderBy == opcao ? AppColors.COR_PRIMARIA : Colors.grey,
            ),
          ),
          child: Text(
            title ,
            style: TextStyle(
              color: filter.orderBy == opcao ? Colors.white : Colors.black,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Ordenação por'),
        Observer(builder: (_) {
          return Row(
            children: [
              buildOption('Data', OrderBy.DATE),
              const SizedBox(width: 18),
              buildOption('Preço', OrderBy.PRICE),
            ],
          );
        }),
      ],
    );
  }
}
