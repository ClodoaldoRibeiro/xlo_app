import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_app/screens/filter/section_title.dart';

class OrderByField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildOption(String title) {
      return GestureDetector(
        onTap: () {},
        child: Container(
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.purple,
            border: Border.all(
              color: Colors.purple,
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Ordernar por'),
        Observer(builder: (_) {
          return Row(
            children: [
              buildOption('Data'),
              const SizedBox(width: 12),
              buildOption('Preço'),
            ],
          );
        }),
      ],
    );
  }
}
