import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_app/screens/retrieve/retrieve_account_screen.dart';
import 'package:xlo_app/screens/signup/signup_screen.dart';
import 'package:xlo_app/screens/themes/app_colors.dart';
import 'package:xlo_app/screens/widgets/xlo_divider.dart';
import 'package:xlo_app/screens/widgets/xlo_error_box.dart';
import 'package:xlo_app/screens/widgets/xlo_icon_button.dart';
import 'package:xlo_app/screens/widgets/xlo_raise_button.dart';
import 'package:xlo_app/stores/login_store.dart';
import 'package:xlo_app/stores/user_manager_store.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore _loginStore = LoginStore();
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  void initState() {
    super.initState();

    when((_) => userManagerStore.userModel != null, () {
      Navigator.of(context).pop(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Entrar",
        ),
        centerTitle: true,
        elevation: 0,
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
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // XLORaisedButton,
                  //Devad,
                  Text(
                    'Acessar com E-mail:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  Observer(builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: XLOErrorBox(
                        message: _loginStore.getErro,
                      ),
                    );
                  }),

                  const SizedBox(
                    height: 8,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                    child: Text(
                      'E-mail:',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      enabled: !_loginStore.getLoading,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: _loginStore.emailErro,
                          hintText: "Exemplo: superxlo@gmail.com"),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: _loginStore.setEmail,
                    );
                  }),

                  const SizedBox(
                    height: 16,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Senha',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => RetrieveAccount()));
                          },
                          child: Text(
                            'Esqueceu sua senha?',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.COR_PRIMARIA,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      obscureText: !_loginStore.isPasswordVisibility,
                      enabled: !_loginStore.getLoading,
                      decoration: InputDecoration(
                        suffixIcon: XLOIconButton(
                            radius: 32,
                            iconData: _loginStore.isPasswordVisibility
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onTap: _loginStore.togglePasswordVisibility),
                        border: const OutlineInputBorder(),
                        errorText: _loginStore.senhaErro,
                        isDense: true,
                        hintText: "Digite sua senha",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: _loginStore.setSenha,
                    );
                  }),

                  Observer(builder: (_) {
                    return XLORaiseButton(
                        child: _loginStore.getLoading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : Text("Entrar"),
                        pressed: _loginStore.loginPressed);
                  }),
                  XLODivider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        const Text(
                          'Não tem uma conta? ',
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => SignUpScreen()));
                          },
                          child: Text(
                            'Cadastre-se',
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
