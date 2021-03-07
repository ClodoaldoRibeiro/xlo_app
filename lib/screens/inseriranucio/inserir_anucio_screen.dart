import 'package:brasil_fields/formatter/real_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo_app/screens/widgets/xlo_drawer.dart';
import 'package:xlo_app/stores/inserir_anucio_store.dart';

import 'components/images_field.dart';

class InserirAnucioScreen extends StatelessWidget {
  InserirAnucioStore _anucioStore = InserirAnucioStore();

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
      fontWeight: FontWeight.w800,
      color: Colors.grey,
      fontSize: 18,
    );

    final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);

    return Scaffold(
      drawer: XLODrawer(),
      appBar: AppBar(
        title: Text(
          "Inserir anúcio",
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                /* Componente para ixibir as imagens. Ele recebe um store com a lista de imagens */
                ImagesField(
                  anucioStore: _anucioStore,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Título',
                    labelStyle: labelStyle,
                    contentPadding: contentPadding,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    labelStyle: labelStyle,
                    contentPadding: contentPadding,
                  ),
                  maxLines: null,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Preço',
                    labelStyle: labelStyle,
                    contentPadding: contentPadding,
                    prefixText: 'R\$ ',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    RealInputFormatter(centavos: true),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
