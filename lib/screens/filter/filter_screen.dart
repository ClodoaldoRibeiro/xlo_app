import 'package:flutter/material.dart';
import 'package:xlo_app/screens/filter/components/orderby_field.dart';
import 'package:xlo_app/stores/filter_store.dart';

class FilterScreen extends StatelessWidget {
  final FilterStore filter = FilterStore();

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
            margin: const EdgeInsets.symmetric(horizontal: 32),
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  OrderByField(filter: filter),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
