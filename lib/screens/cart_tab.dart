// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/config/app_data.dart' as AppData;
import 'package:greengrocer/config/custom_colors.dart';
import 'package:greengrocer/models/cart_item_model.dart';
import 'package:greengrocer/screens/components/cart_item_tale.dart';
import 'package:greengrocer/screens/components/payment_dialog.dart';
import 'package:greengrocer/utils/components/custom_button.dart';
import 'package:greengrocer/utils/constants/constants.dart';
import 'package:greengrocer/utils/utils.services.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final utilServices = UtilsServices();

  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      AppData.cartItems.remove(cartItem);
    });
  }

  double cartTotalPrice() {
    double total = 0;

    for (var item in AppData.cartItems) {
      total += item.totalPrice();
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    final utilsServices = UtilsServices();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Meu Carrinho"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: KUtils.kTitleSize,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: AppData.cartItems.length,
              itemBuilder: (_, index) => CartItemTile(
                cartItem: AppData.cartItems[index],
                removeItem: () => removeItemFromCart(AppData.cartItems[index]),
                totalItem: (totalItem) {
                  setState(() {
                    cartTotalPrice();
                  });
                },
              ),
            ),
          ),

          // Container Total Geral
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 3,
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Total geral:", style: TextStyle(fontSize: 19)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    utilServices.priceToCurrency(cartTotalPrice()),
                    style: TextStyle(
                      color: CustomColors.customSwatchColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),

                // Button concluir compra
                Padding(
                  padding: const EdgeInsets.only(bottom: 22),
                  child: CustomButton(
                    buttonHeight: KUtils.kHeightButton,
                    backgroud: CustomColors.customSwatchColor,
                    label: "Concluir Pedido",
                    labelColor: Colors.white,
                    radius: KUtils.kRadiusDefault,
                    action: () async {
                      bool? result = await showOrderConfirmation();
                      if (result ?? false) {
                        showDialog(
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (_) {
                            return PaymentDialog(
                              order: utilsServices.makeOrder(AppData.cartItems),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Confirmação"),
          content: Text(
            "Deseja realmente concluir o seu pedido?",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(result: false),

              child: Text(
                "Não",
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
                  fontSize: 18,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () => Get.back(result: true),
              child: Text(
                "Sim",
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
