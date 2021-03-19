import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_app/screens/signup/components/field_title.dart';
import 'package:xlo_app/screens/themes/app_colors.dart';
import 'package:xlo_app/screens/widgets/xlo_error_box.dart';
import 'package:xlo_app/screens/widgets/xlo_raise_button.dart';
import 'package:xlo_app/stores/retrieve_store.dart';

class RetrieveAccount extends StatelessWidget {
  RetrieveStore _retrieveStore = RetrieveStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recuperação de conta",
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  elevation: 10,
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Esqueceu sua conta?',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  children: <Widget>[
                                    const Text(
                                      'Não se preocupe! Insira o seu e-mail de cadastro e enviaremos instruções para você.',
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Observer(builder: (_) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: XLOErrorBox(
                                message: _retrieveStore.getErro,
                              ),
                            );
                          }),
                          SizedBox(
                            height: 30,
                          ),
                          FieldTitle(
                            title: 'E-mail',
                            subtitle: 'Enviaremos um e-mail de instrução.',
                          ),
                          Observer(
                            builder: (_) {
                              return TextField(
                                keyboardType: TextInputType.emailAddress,
                                enabled: true,
                                autocorrect: false,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Exemplo: joao@gmail.com',
                                    isDense: true,
                                    errorText: _retrieveStore.emailErro),
                                onChanged: _retrieveStore.setEmail,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Observer(
                            builder: (context) {
                              return XLORaiseButton(
                                  child: Text("Receber instruções"),
                                  pressed: _retrieveStore.emailValid
                                      ? () {
                                          _retrieveStore.recuperarSenha();
                                        }
                                      : null);
                            },
                          ),
                          Divider(
                            color: AppColors.COR_PRIMARIA,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                const Text(
                                  'Voltar para ',
                                  style: TextStyle(fontSize: 16),
                                ),
                                GestureDetector(
                                  onTap: Navigator.of(context).pop,
                                  child: Text(
                                    'Entrar',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: AppColors.COR_PRIMARIA,
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )))),
        ),
      ),
    );
  }
}
