import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:xlo_app/screens/signup/components/field_title.dart';
import 'package:xlo_app/screens/widgets/xlo_divider.dart';
import 'package:xlo_app/screens/widgets/xlo_raise_button.dart';
import 'package:xlo_app/stores/edit_account_store.dart';

class EditAccountScreen extends StatelessWidget {
  final EditAccountStore store = EditAccountStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar conta'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
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
                    Observer(
                      builder: (context) {
                        return IgnorePointer(
                          ignoring: store.loading,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return ToggleSwitch(
                                minWidth: constraints.biggest.width / 2.01,
                                labels: ['Particular', 'Profissional'],
                                cornerRadius: 20,
                                activeBgColor: Colors.purple,
                                inactiveBgColor: Colors.grey,
                                activeFgColor: Colors.white,
                                inactiveFgColor: Colors.white,
                                initialLabelIndex: store.userType.index,
                                onToggle: store.setUserType,
                              );
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitle(
                      title: 'Nome',
                      subtitle: 'Como aparecerá em seus anúncios.',
                    ),
                    Observer(
                      builder: (context) {
                        return TextFormField(
                          enabled: !store.loading,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: João S.',
                            isDense: true,
                            errorText: store.nameError,
                          ),
                          onChanged: store.setName,
                          initialValue: store.name,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitle(
                      title: 'Celular',
                      subtitle: 'Proteja sua conta',
                    ),
                    Observer(
                      builder: (context) {
                        return TextFormField(
                          enabled: !store.loading,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '(99) 99999-9999',
                            isDense: true,
                            errorText: store.phoneError,
                          ),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter()
                          ],
                          onChanged: store.setPhone,
                          initialValue: store.phone,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitle(
                      title: 'Nova senha',
                      subtitle: 'Use letras, números e caracteres especiais',
                    ),
                    Observer(
                      builder: (context) {
                        return TextFormField(
                          enabled: !store.loading,
                          decoration: InputDecoration(
                            hintText: "Informe uma nova senha",
                            border: const OutlineInputBorder(),
                            isDense: true,
                            errorText: store.passError,
                          ),
                          obscureText: true,
                          onChanged: store.setPass1,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitle(
                      title: 'Confirmar a nova senha',
                      subtitle: 'Repita a senha',
                    ),
                    Observer(
                      builder: (context) {
                        return TextFormField(
                          enabled: !store.loading,
                          decoration: InputDecoration(
                            hintText: "Confirme a nova senha",
                            border: const OutlineInputBorder(),
                            isDense: true,
                          ),
                          obscureText: true,
                          onChanged: store.setPass2,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    XLODivider(),
                    Observer(
                      builder: (context) {
                        return XLORaiseButton(
                          child: store.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text("Salvar"),
                          pressed: store.savePressed,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
