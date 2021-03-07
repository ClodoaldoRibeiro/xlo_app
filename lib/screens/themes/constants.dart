import 'package:flutter/material.dart';
import 'size_config.dart';

const kPrimaryColor = Color.fromARGB(255, 211, 118, 130);
const kPrimaryLightColor = Color(0xFFFFECDF);


// Constantes do LinearGradient
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    kPrimaryColor,
    Color.fromARGB(255, 253, 181, 168),
  ],
);

const kCustomDrawerGradientColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color.fromARGB(255, 203, 236, 241), Colors.white],
);

const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kAnimationDuration = Duration(milliseconds: 200);

const headingStyle = TextStyle(
  ///Linha comentada por que estava apresentando erro no meu celular
  //fontSize: getProportionateScreenWidth(24.0),
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  height: 1.5,
  fontFamily: 'MuseoModerno',
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Por favor informe o seu e-mail";
const String kInvalidEmailError = "Digite um e-mail válido";
const String kPassNullError = "Por favor, insira sua senha";
const String kShortPassError = "A senha é muito curta";
const String kMatchPassError = "As senhas não conferem";
const String kNamelNullError = "Digite seu nome";
const String kPhoneNumberNullError = "Por favor, digite seu número de telefone";
const String kAddressNullError = "Por favor, digite seu endereço";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
