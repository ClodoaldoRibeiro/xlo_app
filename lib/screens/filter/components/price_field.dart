import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceField extends StatelessWidget {
  PriceField({this.label, this.onChanged, this.initialValue});
  final String label;
  final Function(int) onChanged;
  final int initialValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          RealInputFormatter(centavos: false)
        ],
        decoration: InputDecoration(
          prefixText: "R\$ ",
          border: OutlineInputBorder(),
          isDense: true,
          labelText: label,
        ),
        onChanged: (value) {
          onChanged(int.tryParse(value.replaceAll('.', '')));
        },
        initialValue: initialValue?.toString(),
      ),
    );
  }
}
