import 'package:brasil_fields/formatter/real_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/screens/inseriranucio/components/category_field.dart';
import 'package:xlo_app/screens/widgets/xlo_drawer.dart';
import 'package:xlo_app/screens/widgets/xlo_error_box.dart';
import 'package:xlo_app/stores/inserir_anucio_store.dart';
import 'package:xlo_app/stores/page_store.dart';

import 'components/cep_field.dart';
import 'components/hide_phone_field.dart';
import 'components/images_field.dart';

class InserirAnucioScreen extends StatefulWidget {
  @override
  _InserirAnucioScreenState createState() => _InserirAnucioScreenState();
}

class _InserirAnucioScreenState extends State<InserirAnucioScreen> {
  InserirAnucioStore _anucioStore = InserirAnucioStore();

  @override
  void initState() {
    super.initState();

    when((_) => _anucioStore.savedAd != null, () {
      GetIt.I<PageStore>().setPage(0);
    });
  }

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
            child: Observer(
              builder: (context) {
                if (_anucioStore.loading)
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          'Salvando Anúncio',
                          style: TextStyle(fontSize: 18, color: Colors.purple),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.purple),
                        )
                      ],
                    ),
                  );
                else
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /* Componente para ixibir as imagens. Ele recebe um store com a lista de imagens */
                      ImagesField(
                        anucioStore: _anucioStore,
                      ),
                      Observer(
                        builder: (context) {
                          return TextFormField(
                            onChanged: _anucioStore.setTitle,
                            decoration: InputDecoration(
                              labelText: 'Título',
                              labelStyle: labelStyle,
                              contentPadding: contentPadding,
                              errorText: _anucioStore.titleError,
                            ),
                          );
                        },
                      ),
                      Observer(
                        builder: (context) {
                          return TextFormField(
                            onChanged: _anucioStore.setDescription,
                            decoration: InputDecoration(
                                labelText: 'Descrição',
                                labelStyle: labelStyle,
                                contentPadding: contentPadding,
                                errorText: _anucioStore.descriptionError),
                            maxLines: null,
                          );
                        },
                      ),
                      CategoryField(anucioStore: _anucioStore),
                      CEPField(_anucioStore),
                      Observer(
                        builder: (context) {
                          return TextFormField(
                            onChanged: _anucioStore.setPrice,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              errorText: _anucioStore.priceError,
                              labelText: 'Preço',
                              labelStyle: labelStyle,
                              contentPadding: contentPadding,
                              prefixText: 'R\$ ',
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              RealInputFormatter(centavos: true),
                            ],
                          );
                        },
                      ),
                      HidePhoneField(
                        anucioStore: _anucioStore,
                      ),
                      XLOErrorBox(
                        message: _anucioStore.error,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Observer(
                        builder: (context) {
                          return SizedBox(
                            height: 50,
                            child: GestureDetector(
                              onTap: _anucioStore.invalidSendPressed,
                              child: RaisedButton(
                                child: Text(
                                  'Enviar',
                                  style: TextStyle(fontSize: 18),
                                ),
                                textColor: Colors.white,
                                color: Colors.orange,
                                disabledColor: Colors.orange.withAlpha(120),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                onPressed: _anucioStore.sendPressed,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
              },
            ),
          ),
        ),
      ),
    );
  }
}
