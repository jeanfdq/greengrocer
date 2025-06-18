import 'package:flutter/material.dart';
import 'package:greengrocer/config/custom_colors.dart';
import 'package:greengrocer/models/cart_item_model.dart';
import 'package:greengrocer/models/order_model.dart';
import 'package:greengrocer/screens/components/payment_dialog.dart';
import 'package:greengrocer/utils/components/custom_button.dart';
import 'package:greengrocer/utils/components/order_status.dart';
import 'package:greengrocer/utils/constants/constants.dart';
import 'package:greengrocer/utils/utils.services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    UtilsServices utilsServices = UtilsServices();
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Card(
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            initiallyExpanded: true,
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,

            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Pedido: ${order.id}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
                Text(
                  utilsServices.formatDateTime(order.createdOrder),
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            childrenPadding: EdgeInsets.fromLTRB(15, 0, 15, 15),
            children: [
              // Esse componente faz a row crecer de acordo com os filhos
              IntrinsicHeight(
                child: Row(
                  children: [
                    // Lista de produtos
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 160,
                        child: ListView(
                          children: order.items.map((orderItem) {
                            return _ListOrderItem(
                              orderItem: orderItem,
                              utilsServices: utilsServices,
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    //Divisor
                    VerticalDivider(color: Colors.blueGrey, width: 20),

                    // OrderStatus
                    Expanded(
                      flex: 2,
                      child: OrderStatus(
                        status: order.status,
                        isOverDue: order.pixOverDue.isBefore(DateTime.now()),
                      ),
                    ),
                  ],
                ),
              ),

              // Total
              Text.rich(
                TextSpan(
                  // Configs feitas no pai é reflitida para todos os filhos
                  style: TextStyle(fontSize: 20),
                  children: [
                    TextSpan(
                      text: "Total: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: utilsServices.priceToCurrency(order.total)),
                  ],
                ),
              ),

              // Pix Copia e Cola
              Visibility(
                visible: order.status == 'pending_payment',
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: CustomButton(
                    icon: Icon(
                      Icons.pix_outlined,
                      color: Colors.white,
                      size: 22,
                    ),

                    buttonHeight: KUtils.kHeightButton,
                    backgroud: CustomColors.customSwatchColor,
                    label: "Pix QrCode ",
                    labelColor: Colors.white,
                    radius: KUtils.kRadiusDefault,
                    action: () => showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) {
                        return PaymentDialog(order: order);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListOrderItem extends StatelessWidget {
  const _ListOrderItem({required this.utilsServices, required this.orderItem});

  final CartItemModel orderItem;
  final UtilsServices utilsServices;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${orderItem.quantity} ${orderItem.item.unit} ",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        Expanded(
          child: Text(orderItem.item.name, style: TextStyle(fontSize: 16)),
        ),
        Text(
          utilsServices.priceToCurrency(orderItem.totalPrice()),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
