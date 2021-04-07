import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_app/screens/filter/components/orderby_field.dart';
import 'package:xlo_app/screens/filter/components/price_range_field.dart';
import 'package:xlo_app/screens/filter/components/vendor_type_field.dart';
import 'package:xlo_app/screens/widgets/xlo_raise_button.dart';
import 'package:xlo_app/stores/filter_store.dart';
import 'package:xlo_app/stores/home_store.dart';

class FilterScreen extends StatelessWidget {
  final FilterStore filter = GetIt.I<HomeStore>().clonedFilter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtrar Busca'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  OrderByField(filter: filter),
                  PriceRangeField(filter: filter),
                  VendorTypeField(filter: filter),
                  Observer(
                    builder: (context) {
                      return XLORaiseButton(
                        child: Text(
                          "Filtrar",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        pressed: filter.isFormValid
                            ? () {
                                filter.save();
                                Navigator.of(context).pop();
                              }
                            : null,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
