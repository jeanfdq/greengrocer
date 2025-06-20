import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/config/custom_colors.dart';
import 'package:greengrocer/utils/components/custom_button.dart';

import 'package:greengrocer/utils/components/custom_text_field.dart';
import 'package:greengrocer/utils/constants/constants.dart';
import 'package:greengrocer/utils/utils.services.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final utilsService = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: utilsService.sizeScreen(context).height,
          child: Stack(
            children: [
              // Back Button
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                  child: IconButton(
                    iconSize: 32,
                    color: Colors.white,
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),

              Column(
                children: [
                  // Header
                  Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // Formulário
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // E-mail
                        const CustomTextField(
                          icon: Icons.email,
                          label: "E-mail",
                          bottomPadding: 15,
                          keyboard: TextInputType.emailAddress,
                        ),

                        // Senha
                        const CustomTextField(
                          icon: Icons.lock,
                          label: "Senha",
                          bottomPadding: 15,
                          keyboard: TextInputType.number,
                          isSecret: true,
                        ),

                        // Nome
                        const CustomTextField(
                          icon: Icons.person,
                          label: "Nome",
                          bottomPadding: 15,
                          keyboard: TextInputType.name,
                        ),

                        // Celular
                        CustomTextField(
                          icon: Icons.phone,
                          label: "Celular",
                          bottomPadding: 15,
                          keyboard: TextInputType.phone,
                          inputFormatter: [
                            utilsService.maskNumberFormatter(
                              "(##) # ####-####",
                            ),
                          ],
                        ),

                        // CPF
                        CustomTextField(
                          icon: Icons.edit_document,
                          label: "CPF",
                          bottomPadding: 15,
                          keyboard: TextInputType.number,
                          inputFormatter: [
                            utilsService.maskNumberFormatter("###.###.###-##"),
                          ],
                        ),

                        // Botão de cadastro
                        CustomButton(
                          buttonHeight: KUtils.kHeightButton,
                          backgroud: Colors.green,
                          label: "Cadastrar Usuário",
                          labelColor: Colors.white,
                          radius: KUtils.kRadiusDefault,
                          action: () => debugPrint('Debugandooo'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
