import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/config/custom_colors.dart';
import 'package:greengrocer/models/order_model.dart';
import 'package:greengrocer/utils/components/custom_button.dart';
import 'package:greengrocer/utils/constants/constants.dart';
import 'package:greengrocer/utils/utils.services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModel order;

  PaymentDialog({super.key, required this.order});

  final utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,

      child: Stack(
        alignment: Alignment.center,
        children: [
          //Conteudo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                //Titulo
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Pagamento com Pix",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                // QR Code
                QrImageView(
                  data: order.pixCopyAndPaste,
                  version: QrVersions.auto,
                  size: 200,
                ),

                // Vencimento
                Text(
                  "Vencimento: ${utilsServices.formatDateTime(order.pixOverDue)}",
                ),

                // Total
                Text(
                  "Total: ${utilsServices.priceToCurrency(order.total)}",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                // botao copia e cola
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomButton(
                    buttonHeight: KUtils.kHeightButton,
                    backgroud: Colors.white,
                    label: "Copie e Cola",
                    labelColor: CustomColors.customSwatchColor,
                    icon: Icon(
                      Icons.copy,
                      color: CustomColors.customSwatchColor,
                    ),
                    borderColor: CustomColors.customSwatchColor,
                    borderWidth: 1,
                    radius: KUtils.kRadiusDefault,
                    action: () {},
                  ),
                ),
              ],
            ),
          ),

          // Botao de fechar
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
