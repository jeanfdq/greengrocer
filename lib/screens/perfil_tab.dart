import 'package:flutter/material.dart';

import 'package:greengrocer/screens/sign_in_screen.dart';
import 'package:greengrocer/utils/components/custom_button.dart';
import 'package:greengrocer/utils/components/custom_text_field.dart';
import 'package:greengrocer/utils/constants/constants.dart';
import 'package:greengrocer/utils/utils.services.dart';

class PerfilTab extends StatelessWidget {
  final utilsServices = UtilsSevices();

  PerfilTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil do usuário"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: KUtils.kTitleSize,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: false,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => SignInScreen()),
            ),
            icon: Icon(Icons.logout, color: Colors.white, size: 28),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
          child: SizedBox(
            height: utilsServices.sizeScreen(context).height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // E-mail
                CustomTextField(
                  icon: Icons.email,
                  label: "Informe seu e-mail..",
                  bottomPadding: 15,
                  keyboard: TextInputType.emailAddress,
                ),

                // Nome
                CustomTextField(
                  icon: Icons.person,
                  label: "Informe seu nome",
                  bottomPadding: 15,
                  keyboard: TextInputType.name,
                ),

                // Celular
                CustomTextField(
                  icon: Icons.phone,
                  label: "Informe seu celular",
                  bottomPadding: 15,
                  inputFormatter: [
                    utilsServices.maskNumberFormatter("(##) # ####-####"),
                  ],
                  keyboard: TextInputType.phone,
                ),

                //CPF
                CustomTextField(
                  icon: Icons.edit_document,
                  label: "Informe seu CPF",
                  bottomPadding: 15,
                  keyboard: TextInputType.number,
                  inputFormatter: [
                    utilsServices.maskNumberFormatter("###.###.###-##"),
                  ],
                  isSecret: true,
                ),

                // Botao de Atualizar Senha
                CustomButton(
                  buttonHeight: KUtils.kHeightButton,
                  backgroud: Colors.white.withAlpha(190),
                  label: "Atualizar a senha",
                  labelColor: Colors.green,
                  borderWidth: 1.5,
                  borderColor: Colors.green,
                  radius: KUtils.kRadiusDefault,
                  action: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
