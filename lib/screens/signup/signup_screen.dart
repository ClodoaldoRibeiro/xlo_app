import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_app/screens/themes/app_colors.dart';
import 'package:xlo_app/screens/widgets/xlo_divider.dart';
import 'package:xlo_app/screens/widgets/xlo_error_box.dart';
import 'package:xlo_app/screens/widgets/xlo_raise_button.dart';
import 'package:xlo_app/stores/signup_store.dart';

import 'components/field_title.dart';

class SignUpScreen extends StatelessWidget {
  SignupStore _signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Cadastrar",
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
                          Observer(builder: (_) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: XLOErrorBox(
                                message: _signupStore.getErro,
                              ),
                            );
                          }),
                          FieldTitle(
                            title: 'Apelido',
                            subtitle: 'Como aparecerá em seus anúncios.',
                          ),
                          Observer(builder: (_) {
                            return TextField(
                              keyboardType: TextInputType.text,
                              enabled: !_signupStore.getLoading,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Exemplo: João S.',
                                  isDense: true,
                                  errorText: _signupStore.nameErro),
                              onChanged: _signupStore.setNome,
                            );
                          }),
                          const SizedBox(
                            height: 16,
                          ),
                          FieldTitle(
                            title: 'E-mail',
                            subtitle: 'Enviaremos um e-mail de confirmação.',
                          ),
                          Observer(builder: (_) {
                            return TextField(
                              keyboardType: TextInputType.emailAddress,
                              enabled: !_signupStore.getLoading,
                              autocorrect: false,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Exemplo: joao@gmail.com',
                                  isDense: true,
                                  errorText: _signupStore.emailErro),
                              onChanged: _signupStore.setEmail,
                            );
                          }),
                          const SizedBox(
                            height: 16,
                          ),
                          FieldTitle(
                            title: 'Celular',
                            subtitle: 'Proteja sua conta',
                          ),
                          Observer(builder: (_) {
                            return TextField(
                              enabled: !_signupStore.getLoading,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '(99) 99999-9999',
                                  isDense: true,
                                  errorText: _signupStore.phoneErro),
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                TelefoneInputFormatter()
                              ],
                              onChanged: _signupStore.setPhone,
                            );
                          }),
                          const SizedBox(
                            height: 16,
                          ),
                          FieldTitle(
                            title: 'Senha',
                            subtitle:
                                'Use letras, números e caracteres especiais',
                          ),
                          Observer(builder: (_) {
                            return TextField(
                              enabled: !_signupStore.getLoading,
                              decoration: InputDecoration(
                                  hintText: "Informe uma senha",
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  errorText: _signupStore.senhaErro),
                              obscureText: true,
                              onChanged: _signupStore.setSenha,
                            );
                          }),
                          const SizedBox(
                            height: 16,
                          ),
                          FieldTitle(
                            title: 'Confirmar Senha',
                            subtitle: 'Repita a senha',
                          ),
                          Observer(builder: (_) {
                            return TextField(
                              enabled: !_signupStore.getLoading,
                              decoration: InputDecoration(
                                  hintText: "Confirme a senha",
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  errorText: _signupStore.confirSenhaErro),
                              obscureText: true,
                              onChanged: _signupStore.setConfirSenha,
                            );
                          }),
                          Observer(builder: (_) {
                            return XLORaiseButton(
                                child: _signupStore.getLoading
                                    ? CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.white),
                                      )
                                    : Text("Cadastrar-se"),
                                pressed: _signupStore.signUpPressed);
                          }),
                          XLODivider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                const Text(
                                  'Já tem uma conta? ',
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
                      ))),
            ),
          ),
        ));
  }
}
