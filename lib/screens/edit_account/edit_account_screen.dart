import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:xlo_app/screens/signup/components/field_title.dart';
import 'package:xlo_app/screens/widgets/xlo_divider.dart';

class EditAccountScreen extends StatelessWidget {
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
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return ToggleSwitch(
                          minWidth: constraints.biggest.width / 2.01,
                          labels: ['Particular', 'Profissional'],
                          cornerRadius: 20,
                          activeBgColor: Colors.purple,
                          inactiveBgColor: Colors.grey,
                          activeFgColor: Colors.white,
                          inactiveFgColor: Colors.white,
                          initialLabelIndex: 0,
                          onToggle: (index) {},
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
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Exemplo: João S.',
                        isDense: true,
                      ),
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitle(
                      title: 'Celular',
                      subtitle: 'Proteja sua conta',
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '(99) 99999-9999',
                        isDense: true,
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter()
                      ],
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitle(
                      title: 'Nova senha',
                      subtitle: 'Use letras, números e caracteres especiais',
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Informe uma nova senha",
                        border: const OutlineInputBorder(),
                        isDense: true,
                      ),
                      obscureText: true,
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitle(
                      title: 'Confirmar a nova senha',
                      subtitle: 'Repita a senha',
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Confirme a nova senha",
                        border: const OutlineInputBorder(),
                        isDense: true,
                      ),
                      obscureText: true,
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    XLODivider(),
                    Container(
                      height: 46,
                      margin: EdgeInsets.only(top: 4, bottom: 4),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        color: Colors.orangeAccent,
                        child: Text("Salvar"),
                        textColor: Colors.white,
                        disabledColor: Colors.orange.withAlpha(120),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      height: 46,
                      margin: EdgeInsets.only(top: 8, bottom: 12),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        color: Colors.redAccent,
                        child: Text("Sair"),
                        textColor: Colors.white,
                        disabledColor: Colors.redAccent.withAlpha(120),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )
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
