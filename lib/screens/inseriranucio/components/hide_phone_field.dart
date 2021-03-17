import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_app/stores/inserir_anucio_store.dart';

class HidePhoneField extends StatelessWidget {
  HidePhoneField(this.anucioStore);

  final InserirAnucioStore anucioStore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Observer(builder: (_) {
            return Checkbox(
              value: anucioStore.hidePhone,
              onChanged: anucioStore.setHidePhone,
              activeColor: Colors.purple,
            );
          }),
          Expanded(
            child: Text(
              'Ocultar o meu telefone neste anúncio',
            ),
          )
        ],
      ),
    );
  }
}
