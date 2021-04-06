import 'package:flutter/material.dart';
import 'package:xlo_app/screens/filter/section_title.dart';
import 'package:xlo_app/stores/filter_store.dart';

class VendorTypeField extends StatelessWidget {
  VendorTypeField({this.filter});

  final FilterStore filter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Tipo de anunciante'),
      ],
    );
  }
}
