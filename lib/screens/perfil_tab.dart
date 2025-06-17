// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:greengrocer/config/app_data.dart' as AppData;
import 'package:greengrocer/screens/sign_in_screen.dart';
import 'package:greengrocer/utils/components/custom_button.dart';
import 'package:greengrocer/utils/components/custom_text_field.dart';
import 'package:greengrocer/utils/constants/constants.dart';
import 'package:greengrocer/utils/utils.services.dart';

class PerfilTab extends StatefulWidget {
  const PerfilTab({super.key});

  @override
  State<PerfilTab> createState() => _PerfilTabState();
}

class _PerfilTabState extends State<PerfilTab> {
  final utilsServices = UtilsServices();

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
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 32, 15, 15),
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

                  initialValeu: AppData.user.email,
                  isReadOnly: true,
                ),

                // Nome
                CustomTextField(
                  isReadOnly: true,
                  icon: Icons.person,
                  label: "Informe seu nome",
                  bottomPadding: 15,
                  initialValeu: AppData.user.name,
                ),

                // Celular
                CustomTextField(
                  isReadOnly: true,
                  icon: Icons.phone,
                  label: "Informe seu celular",
                  bottomPadding: 15,
                  inputFormatter: [
                    utilsServices.maskNumberFormatter("(##) # ####-####"),
                  ],
                  initialValeu: AppData.user.phone,
                ),

                //CPF
                CustomTextField(
                  isReadOnly: true,
                  icon: Icons.edit_document,
                  label: "Informe seu CPF",
                  bottomPadding: 15,

                  inputFormatter: [
                    utilsServices.maskNumberFormatter("###.###.###-##"),
                  ],
                  initialValeu: AppData.user.cpf,
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
                  action: () async {
                    bool? result = await updatePasswordDialog();
                    print(result);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> updatePasswordDialog() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Titulo
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        "Atualização de senha",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    // Senha Atual
                    CustomTextField(
                      icon: Icons.lock,
                      label: "Senha atual",
                      keyboard: TextInputType.number,
                      isSecret: true,
                      topPadding: 15,
                    ),

                    // Nova Senha
                    CustomTextField(
                      icon: Icons.lock_outlined,
                      label: "Nova senha",
                      keyboard: TextInputType.number,
                      isSecret: true,
                      topPadding: 15,
                    ),

                    // Confirmação da Nova Senha
                    CustomTextField(
                      icon: Icons.lock_outlined,
                      label: "Confirmação da senha atual",
                      keyboard: TextInputType.number,
                      isSecret: true,
                      topPadding: 15,
                      bottomPadding: 15,
                    ),

                    // Botao de Atualizar
                    CustomButton(
                      buttonHeight: KUtils.kHeightButton,
                      backgroud: Colors.green,
                      label: "Atualizar senha",
                      labelColor: Colors.white,
                      radius: KUtils.kRadiusDefault,
                      action: () => Navigator.of(context).pop(true),
                    ),
                  ],
                ),
              ),

              // BOtão de Fechar
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  iconSize: 24,
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  icon: Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
