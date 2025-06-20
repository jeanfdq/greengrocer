import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:greengrocer/screens/pages_routes/pages_routes.dart';

import 'package:greengrocer/utils/components/custom_button.dart';
import 'package:greengrocer/utils/components/custom_text_field.dart';
import 'package:greengrocer/config/custom_colors.dart';
import 'package:greengrocer/utils/constants/constants.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeDevice = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: sizeDevice.height,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Nome do App
                    Text.rich(
                      TextSpan(
                        style: TextStyle(fontSize: 40),
                        children: [
                          TextSpan(
                            text: "Green",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "grocer",
                            style: TextStyle(
                              color: CustomColors.customContrastColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Categorias
                    SizedBox(
                      height: 40,
                      child: DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Verduras'),
                            FadeAnimatedText('Legumes'),
                            FadeAnimatedText('Cereais'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Formulario
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Campo de E-mail
                    CustomTextField(
                      icon: Icons.email,
                      label: "E-mail",
                      keyboard: TextInputType.emailAddress,
                      bottomPadding: 15,
                    ),

                    // Campo de Senha
                    CustomTextField(
                      icon: Icons.lock,
                      label: "Senha",
                      keyboard: TextInputType.numberWithOptions(),
                      isSecret: true,
                      bottomPadding: 15,
                    ),

                    // Botão de Login
                    CustomButton(
                      buttonHeight: KUtils.kHeightButton,
                      backgroud: Colors.green,
                      label: "Login",
                      labelColor: Colors.white,
                      radius: KUtils.kRadiusDefault,
                      //getOff é o mesmo que pushReplacement
                      action: () => Get.offNamed(PagesRoutes.baseRoute),
                    ),

                    // Esqueci minha senha
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor: WidgetStatePropertyAll(Colors.green),
                        ),
                        onPressed: () {},
                        child: const Text("Esqueceu a senha?"),
                      ),
                    ),

                    // Divider
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(color: Colors.grey, thickness: 1),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text('ou'),
                          ),
                          Expanded(
                            child: Divider(color: Colors.grey, thickness: 1),
                          ),
                        ],
                      ),
                    ),

                    // Botao de Criar Conta
                    CustomButton(
                      buttonHeight: KUtils.kHeightButton,
                      backgroud: Colors.white,
                      label: "Criar conta",
                      labelColor: Colors.green,
                      borderWidth: 1.5,
                      borderColor: Colors.green,
                      radius: KUtils.kRadiusDefault,
                      action: () => Get.toNamed(PagesRoutes.signUpRoute),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
